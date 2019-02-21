
const api = `http://localhost:8080/api`

export const environment = {

    production: false,
    api: {
        config: `${api}/config`,
        passwordReset: `${api}/password-reset`,
        passwordResetRequests: `${api}/password-reset-requests`,
        accountConfirm: `${api}/xusers/account-confirm`,
        login: `${api}/xusers/login`,
        verifyCredentials: `${api}/xusers/verifyCredentials`,
        users: `${api}/xusers`,
        orders: `${api}/orders`,
        dailyReport: `${api}/orders/dailyReport`,
        monthlyReport: `${api}/orders/monthlyReport`,
        institutions: `${api}/institutions`,
        institutionTypes: `${api}/institutionTypes`,
        orderStatus: `${api}/orderstatus`,
        orderPriorities: `${api}/order-priorities`,
        unitTypes: `${api}/unit-types`
    },
    storage: sessionStorage,
    sessionAlertOffsetInMin: 2

};
