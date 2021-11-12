import Rails from '@rails/ujs';

export const storeObject = {
  state: {
    areaList: [],
    dataList: [],
    dataType: "",
    currentArea: "",
    currentDataId: "",
    searchData: {},        // 包含景點、活動、餐廳、住宿四個物件，底下個別是 dataList
    dataDetail: {}
  },
  getters: {
    areaList: state => state.areaList,
    dataList: state => state.dataList,
    dataType: state => state.dataType,
    currentArea: state => state.currentArea,
    searchData: state => state.searchData,
    dataDetail: state => state.dataDetail,
  },
  mutations: {
    GET_ALL_AREA(state, areaList) {
      state.areaList = areaList;
    },
    UPDATE_DATA_LIST(state, dataList) {
      state.dataList = dataList;
    },
    UPDATE_CURRENT_DATA_TYPE(state, dataType) {
      state.dataType = dataType;
    },
    UPDATE_CURRENT_DATA_AREA(state, currentArea) {
      state.currentArea = currentArea;
    },
    GET_SINGLE_DATA_DETAIL(state, dataDetail) {
      state.dataDetail = dataDetail;
    },
    UPDATE_SEARCH_DATA(state, searchData) {
      state.searchData = searchData;
    }
  },
  actions: {
    getCityTownList({ commit }) {
      Rails.ajax({
        url: "/api/v1/citys",
        type: 'GET',
        dataType: 'json',
        success: res => {
          commit("GET_ALL_AREA", res);
        },
        error: error => {
          console.log(error);            
        }
      })
    },
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
    }
  }
}