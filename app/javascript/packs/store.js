import Rails from '@rails/ujs';

export const storeObject = {
  state: {
    areaList: [],
    dataList: [],
    dataType: "",
    hotDataList: [],
    themeDataList: [],
    themeName: "",
    currentArea: "",
    currentDataId: "",
    searchData: {},        // 包含景點、活動、餐廳、住宿四個物件，底下個別是 dataList
    dataDetail: {}
  },
  getters: {
    areaList: state => state.areaList,
    dataList: state => state.dataList,
    dataType: state => state.dataType,
    hotDataList: state => state.hotDataList,
    themeDataList: state => state.themeDataList,
    themeName: state => state.themeName,
    currentArea: state => state.currentArea,
    searchData: state => state.searchData,
    dataDetail: state => state.dataDetail,
  },
  mutations: {
    GET_ALL_AREAS(state, areaList) {
      state.areaList = areaList;
    },
    UPDATE_AREAS(state, { areaIndex, cityIndex }) {
      state.areaList[areaIndex].citys[cityIndex].is_open = !state.areaList[areaIndex].citys[cityIndex].is_open
    },
    UPDATE_DATA_LIST(state, dataList) {
      state.dataList = dataList;
    },
    UPDATE_CURRENT_DATA_TYPE(state, dataType) {
      state.dataType = dataType;
    },
    UPDATE_HOT_DATA_LIST(state, hotDataList) {
      state.hotDataList = hotDataList;
    },
    UPDATE_THEME_DATA_LIST(state, themeDataList) {
      state.themeDataList = themeDataList;
    },
    UPDATE_THEME_NAME(state, themeName) {
      state.themeName = themeName;
    },
    UPDATE_CURRENT_DATA_AREA(state, currentArea) {
      state.currentArea = currentArea;
    },
    GET_SINGLE_DATA_DETAIL(state, dataDetail) {
      if (dataDetail.Picture && dataDetail.Picture.PictureUrl1) {
        dataDetail.showPicture = dataDetail.Picture.PictureUrl1;
      } else {
        dataDetail.showPicture = "";
      }
      state.dataDetail = dataDetail;
    },
    UPDATE_SINGLE_DATA_SHOWPICTURE(state, PictureUrl) {
      state.dataDetail.showPicture = PictureUrl
    },
    UPDATE_SEARCH_DATA(state, searchData) {
      state.searchData = searchData;
    }
  },
  actions: {
    // 地區列表
    getCityTownList({ commit }) {
      Rails.ajax({
        url: "/api/v1/citys",
        type: 'GET',
        dataType: 'json',
        success: res => {
          commit("GET_ALL_AREAS", res);
        },
        error: error => {
          console.log(error);            
        }
      })
    },
    toggleAreaList({ commit }, { areaIndex, cityIndex }) {
      commit("UPDATE_AREAS", { areaIndex, cityIndex });
    },

    // 取得單一類型資料列表
    getAllDataList({ commit }, type) {
      Rails.ajax({
        url: `/api/v1/${type}`,
        type: 'GET',
        dataType: 'json',
        success: res => {
          commit("UPDATE_DATA_LIST", res.data);
          commit("UPDATE_CURRENT_DATA_TYPE", res.type);
        },
        error: error => {
          console.log(error);            
        }
      })
    },

    // 取得熱門搜尋、評論資料列表
    getHotDataList({ commit }) {
      Rails.ajax({
        url: "/api/v1/hot",
        type: 'GET',
        dataType: 'json',
        success: res => {
          commit("UPDATE_HOT_DATA_LIST", res);
        },
        error: error => {
          console.log(error);            
        }
      })
    },

    // 取得隨機主題資料列表
    getRandomThemeDataList({ commit }) {
      Rails.ajax({
        url: "/api/v1/theme",
        type: 'GET',
        dataType: 'json',
        success: res => {
          commit("UPDATE_THEME_DATA_LIST", res.data);
          commit("UPDATE_THEME_NAME", res.theme_name);
        },
        error: error => {
          console.log(error);            
        }
      })
    },

    // 地區篩選資料
    filterDataListWithTown({ commit }, town) {
      const type = this.state.dataType;
      Rails.ajax({
        url: `/api/v1/${type}?city=${town}`,
        type: 'GET',
        dataType: 'json',
        success: res => {
          commit("UPDATE_DATA_LIST", res.data);
          commit("UPDATE_CURRENT_DATA_AREA", town);
        },
        error: error => {
          console.log(error);            
        }
      })
    },

    // 關鍵字搜尋
    filterDataListWithKeyword({ commit }, keyword){
      Rails.ajax({
        url: `/api/v1/search?keyword=${keyword}`,
        type: 'GET',
        dataType: 'json',
        success: res => {
          commit("UPDATE_SEARCH_DATA", res);
        },
        error: error => {
          console.log(error);            
        }
      })
    },

    // detail
    getSingleDataDetail({ commit }, { dataType, dataId }) {
      // 這裡的 type 要用 Card > Detail 傳進來的才會是這張頁面的類型
      Rails.ajax({
        url: `/api/v1/detail/${dataType}/${dataId}`,
        type: 'GET',
        dataType: 'json',
        success: res => {
          commit("GET_SINGLE_DATA_DETAIL", res);
        },
        error: error => {
          console.log(error);            
        }
      })
    },
    changeShowPicture({ commit }, PictureUrl) {
      commit("UPDATE_SINGLE_DATA_SHOWPICTURE", PictureUrl);
    }
  }
}