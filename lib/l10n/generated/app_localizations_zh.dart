// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '门禁系统';

  @override
  String get welcome => '欢迎';

  @override
  String get login => '登录';

  @override
  String get logout => '退出登录';

  @override
  String get settings => '设置';

  @override
  String get language => '语言';

  @override
  String get english => '英语';

  @override
  String get chineseSimplified => '简体中文';

  @override
  String get chineseTraditional => '繁体中文';

  @override
  String get personnel => '人员管理';

  @override
  String get devices => '设备管理';

  @override
  String get accessLog => '访问记录';

  @override
  String get backup => '备份';

  @override
  String get serverUrl => '服务器地址';

  @override
  String get enterServerUrl => '输入服务器地址';

  @override
  String get password => '密码';

  @override
  String get enterPassword => '输入您的密码';

  @override
  String get signIn => '登录';

  @override
  String get signingIn => '登录中...';

  @override
  String get serverUrlRequired => '服务器地址是必需的';

  @override
  String get passwordRequired => '密码是必需的';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get manageAndMonitorDevices => '管理和监控门禁设备';

  @override
  String get searchDevices => '按序列号、型号、IP、标签或MAC搜索设备...';

  @override
  String get noDevicesFound => '未找到设备。';

  @override
  String get noDevicesMatchingSearch => '未找到匹配搜索条件的设备。';

  @override
  String get deviceList => '设备列表';

  @override
  String get devicesCount => '设备';

  @override
  String get ip => 'IP';

  @override
  String get mac => 'MAC';

  @override
  String get modified => '修改时间';

  @override
  String get showing => '显示';

  @override
  String get to => '到';

  @override
  String get paginationOf => '共';

  @override
  String get managePersonnel => '管理人员和访问权限';

  @override
  String get searchPersonnel => '按姓名、ID或部门搜索人员...';

  @override
  String get noPersonnelFound => '未找到人员。';

  @override
  String get noPersonnelMatchingSearch => '未找到匹配搜索条件的人员。';

  @override
  String get personnelList => '人员列表';

  @override
  String get personnelCount => '人员';

  @override
  String get addPersonnel => '添加人员';

  @override
  String get editPersonnel => '编辑人员';

  @override
  String get name => '姓名';

  @override
  String get employeeId => '员工ID';

  @override
  String get department => '部门';

  @override
  String get position => '职位';

  @override
  String get phone => '电话';

  @override
  String get email => '邮箱';

  @override
  String get accessLevel => '访问级别';

  @override
  String get save => '保存';

  @override
  String get cancel => '取消';

  @override
  String get nameRequired => '姓名是必需的';

  @override
  String get employeeIdRequired => '员工ID是必需的';

  @override
  String get departmentRequired => '部门是必需的';

  @override
  String get positionRequired => '职位是必需的';

  @override
  String get phoneRequired => '电话是必需的';

  @override
  String get emailRequired => '邮箱是必需的';

  @override
  String get accessLevelRequired => '访问级别是必需的';

  @override
  String get viewAccessLogs => '查看访问日志和安全事件';

  @override
  String get searchLogs => '按人员、设备或事件搜索日志...';

  @override
  String get noLogsFound => '未找到访问日志。';

  @override
  String get noLogsMatchingSearch => '未找到匹配搜索条件的日志。';

  @override
  String get accessLogList => '访问日志列表';

  @override
  String get logs => '日志';

  @override
  String get event => '事件';

  @override
  String time(int number) {
    return '时间 $number';
  }

  @override
  String get device => '设备';

  @override
  String get granted => '已授权';

  @override
  String get denied => '已拒绝';

  @override
  String get backupAndRestore => '备份和恢复系统数据';

  @override
  String get createBackup => '创建备份';

  @override
  String get restoreBackup => '恢复备份';

  @override
  String get backupCreated => '备份创建成功';

  @override
  String get backupRestored => '备份恢复成功';

  @override
  String get appSettings => '配置应用程序设置';

  @override
  String get general => '常规';

  @override
  String get security => '安全';

  @override
  String get notifications => '通知';

  @override
  String get about => '关于';

  @override
  String get version => '版本';

  @override
  String get build => '构建';

  @override
  String get selectAll => '全选';

  @override
  String get photo => '照片';

  @override
  String get updateImage => '更新图片';

  @override
  String get addPhoto => '添加照片';

  @override
  String get basicInformation => '基本信息';

  @override
  String get enterPersonnelName => '输入人员姓名';

  @override
  String get enterCardNumber => '输入卡号';

  @override
  String get selectAccessGroup => '选择访问组';

  @override
  String get deviceMapping => '设备映射';

  @override
  String get saving => '保存中...';

  @override
  String get confirmDelete => '确认删除';

  @override
  String get deletePersonnelConfirm => '您确定要删除此人员吗？此操作无法撤销。';

  @override
  String get delete => '删除';

  @override
  String get personnelUpdatedSuccessfully => '人员更新成功';

  @override
  String get personnelAddedSuccessfully => '人员添加成功';

  @override
  String errorPickingImage(String error) {
    return '选择图片时出错：$error';
  }

  @override
  String get admin => '管理员';

  @override
  String get employee => '员工';

  @override
  String get guest => '访客';

  @override
  String get exportLogs => '导出日志';

  @override
  String get filters => '筛选器';

  @override
  String get deviceSn => '设备 (序列号)';

  @override
  String get allDevices => '所有设备';

  @override
  String get personnelName => '人员姓名';

  @override
  String get searchByName => '按姓名搜索...';

  @override
  String get fromDate => '开始日期';

  @override
  String get selectFromDate => '选择开始日期';

  @override
  String get toDate => '结束日期';

  @override
  String get selectToDate => '选择结束日期';

  @override
  String get applyFilters => '应用筛选';

  @override
  String get clearFilters => '清除筛选';

  @override
  String get noAccessLogsFound => '未找到访问日志';

  @override
  String get accessLogs => '访问日志';

  @override
  String get exportingAccessLogs => '正在导出访问日志...';

  @override
  String accessLogsExported(String date) {
    return '访问日志已导出为 access-logs-$date.csv';
  }

  @override
  String get entry => '进入';

  @override
  String get exit => '离开';

  @override
  String errorSelectingBackupFile(String error) {
    return '选择备份文件时出错：$error';
  }

  @override
  String get pleaseSelectBackupFile => '请先选择备份文件';

  @override
  String get confirmRestore => '确认恢复';

  @override
  String get confirmRestoreMessage => '您确定要从上传的备份文件恢复吗？此操作将覆盖当前数据且无法撤销。';

  @override
  String get confirmRestoreButton => '确认恢复';

  @override
  String get configurationSavedSuccessfully => '配置保存成功';

  @override
  String get actions => '操作';

  @override
  String get restoreFromBackup => '从备份恢复';

  @override
  String get uploadBackupFile => '上传备份文件';

  @override
  String get restoring => '恢复中...';

  @override
  String get creatingBackup => '创建备份中...';

  @override
  String get backupNow => '立即备份';

  @override
  String get configuration => '配置';

  @override
  String get enableDailyBackup => '启用每日备份';

  @override
  String get backupTime24h => '备份时间 (24小时制)';

  @override
  String get backupPath => '备份路径';

  @override
  String get backupPathHint => '/backups/system';

  @override
  String get saveConfiguration => '保存配置';

  @override
  String get saveConfigurationLoading => '保存配置中...';

  @override
  String get no => '编号';

  @override
  String get accessGroup => '访问组';

  @override
  String get sunday => '周日';

  @override
  String get monday => '周一';

  @override
  String get tuesday => '周二';

  @override
  String get wednesday => '周三';

  @override
  String get thursday => '周四';

  @override
  String get friday => '周五';

  @override
  String get saturday => '周六';

  @override
  String get hhmm => '时:分';

  @override
  String get contractor => '承包商';

  @override
  String get visitor => '访客';
}

/// The translations for Chinese, as used in Hong Kong (`zh_HK`).
class AppLocalizationsZhHk extends AppLocalizationsZh {
  AppLocalizationsZhHk() : super('zh_HK');

  @override
  String get appTitle => '門禁系統';

  @override
  String get welcome => '歡迎';

  @override
  String get login => '登入';

  @override
  String get logout => '登出';

  @override
  String get settings => '設定';

  @override
  String get language => '語言';

  @override
  String get english => '英文';

  @override
  String get chineseSimplified => '簡體中文';

  @override
  String get chineseTraditional => '繁體中文';

  @override
  String get personnel => '人員管理';

  @override
  String get devices => '設備管理';

  @override
  String get accessLog => '存取記錄';

  @override
  String get backup => '備份';

  @override
  String get serverUrl => '伺服器地址';

  @override
  String get enterServerUrl => '輸入伺服器地址';

  @override
  String get password => '密碼';

  @override
  String get enterPassword => '輸入您的密碼';

  @override
  String get signIn => '登入';

  @override
  String get signingIn => '登入中...';

  @override
  String get serverUrlRequired => '伺服器地址是必需的';

  @override
  String get passwordRequired => '密碼是必需的';

  @override
  String get selectLanguage => '選擇語言';

  @override
  String get manageAndMonitorDevices => '管理和監控門禁設備';

  @override
  String get searchDevices => '按序列號、型號、IP、標籤或MAC搜尋設備...';

  @override
  String get noDevicesFound => '未找到設備。';

  @override
  String get noDevicesMatchingSearch => '未找到符合搜尋條件的設備。';

  @override
  String get deviceList => '設備列表';

  @override
  String get devicesCount => '設備';

  @override
  String get ip => 'IP';

  @override
  String get mac => 'MAC';

  @override
  String get modified => '修改時間';

  @override
  String get showing => '顯示';

  @override
  String get to => '到';

  @override
  String get paginationOf => '共';

  @override
  String get managePersonnel => '管理人員和存取權限';

  @override
  String get searchPersonnel => '按姓名、ID或部門搜尋人員...';

  @override
  String get noPersonnelFound => '未找到人員。';

  @override
  String get noPersonnelMatchingSearch => '未找到符合搜尋條件的人員。';

  @override
  String get personnelList => '人員列表';

  @override
  String get personnelCount => '人員';

  @override
  String get addPersonnel => '新增人員';

  @override
  String get editPersonnel => '編輯人員';

  @override
  String get name => '姓名';

  @override
  String get employeeId => '員工ID';

  @override
  String get department => '部門';

  @override
  String get position => '職位';

  @override
  String get phone => '電話';

  @override
  String get email => '電郵';

  @override
  String get accessLevel => '存取級別';

  @override
  String get save => '儲存';

  @override
  String get cancel => '取消';

  @override
  String get nameRequired => '姓名是必需的';

  @override
  String get employeeIdRequired => '員工ID是必需的';

  @override
  String get departmentRequired => '部門是必需的';

  @override
  String get positionRequired => '職位是必需的';

  @override
  String get phoneRequired => '電話是必需的';

  @override
  String get emailRequired => '電郵是必需的';

  @override
  String get accessLevelRequired => '存取級別是必需的';

  @override
  String get viewAccessLogs => '查看存取記錄和安全事件';

  @override
  String get searchLogs => '按人員、設備或事件搜尋記錄...';

  @override
  String get noLogsFound => '未找到存取記錄。';

  @override
  String get noLogsMatchingSearch => '未找到符合搜尋條件的記錄。';

  @override
  String get accessLogList => '存取記錄列表';

  @override
  String get logs => '記錄';

  @override
  String get event => '事件';

  @override
  String time(int number) {
    return '時間 $number';
  }

  @override
  String get device => '設備';

  @override
  String get granted => '已授權';

  @override
  String get denied => '已拒絕';

  @override
  String get backupAndRestore => '備份和還原系統數據';

  @override
  String get createBackup => '建立備份';

  @override
  String get restoreBackup => '還原備份';

  @override
  String get backupCreated => '備份建立成功';

  @override
  String get backupRestored => '備份還原成功';

  @override
  String get appSettings => '配置應用程式設定';

  @override
  String get general => '一般';

  @override
  String get security => '安全';

  @override
  String get notifications => '通知';

  @override
  String get about => '關於';

  @override
  String get version => '版本';

  @override
  String get build => '建置';

  @override
  String get selectAll => '全選';

  @override
  String get photo => '照片';

  @override
  String get updateImage => '更新圖片';

  @override
  String get addPhoto => '新增照片';

  @override
  String get basicInformation => '基本資訊';

  @override
  String get enterPersonnelName => '輸入人員姓名';

  @override
  String get enterCardNumber => '輸入卡號';

  @override
  String get selectAccessGroup => '選擇存取群組';

  @override
  String get deviceMapping => '設備對應';

  @override
  String get saving => '儲存中...';

  @override
  String get confirmDelete => '確認刪除';

  @override
  String get deletePersonnelConfirm => '您確定要刪除此人員嗎？此操作無法復原。';

  @override
  String get delete => '刪除';

  @override
  String get personnelUpdatedSuccessfully => '人員更新成功';

  @override
  String get personnelAddedSuccessfully => '人員新增成功';

  @override
  String errorPickingImage(String error) {
    return '選擇圖片時發生錯誤：$error';
  }

  @override
  String get admin => '管理員';

  @override
  String get employee => '員工';

  @override
  String get guest => '訪客';

  @override
  String get exportLogs => '匯出記錄';

  @override
  String get filters => '篩選器';

  @override
  String get deviceSn => '設備 (序號)';

  @override
  String get allDevices => '所有設備';

  @override
  String get personnelName => '人員姓名';

  @override
  String get searchByName => '按姓名搜尋...';

  @override
  String get fromDate => '開始日期';

  @override
  String get selectFromDate => '選擇開始日期';

  @override
  String get toDate => '結束日期';

  @override
  String get selectToDate => '選擇結束日期';

  @override
  String get applyFilters => '套用篩選';

  @override
  String get clearFilters => '清除篩選';

  @override
  String get noAccessLogsFound => '未找到存取記錄';

  @override
  String get accessLogs => '存取記錄';

  @override
  String get exportingAccessLogs => '正在匯出存取記錄...';

  @override
  String accessLogsExported(String date) {
    return '存取記錄已匯出為 access-logs-$date.csv';
  }

  @override
  String get entry => '進入';

  @override
  String get exit => '離開';

  @override
  String errorSelectingBackupFile(String error) {
    return '選擇備份檔案時發生錯誤：$error';
  }

  @override
  String get pleaseSelectBackupFile => '請先選擇備份檔案';

  @override
  String get confirmRestore => '確認還原';

  @override
  String get confirmRestoreMessage => '您確定要從上傳的備份檔案還原嗎？此操作將覆蓋目前資料且無法復原。';

  @override
  String get confirmRestoreButton => '確認還原';

  @override
  String get configurationSavedSuccessfully => '設定儲存成功';

  @override
  String get actions => '操作';

  @override
  String get restoreFromBackup => '從備份還原';

  @override
  String get uploadBackupFile => '上傳備份檔案';

  @override
  String get restoring => '還原中...';

  @override
  String get creatingBackup => '建立備份中...';

  @override
  String get backupNow => '立即備份';

  @override
  String get configuration => '設定';

  @override
  String get enableDailyBackup => '啟用每日備份';

  @override
  String get backupTime24h => '備份時間 (24小時制)';

  @override
  String get backupPath => '備份路徑';

  @override
  String get backupPathHint => '/backups/system';

  @override
  String get saveConfiguration => '儲存設定';

  @override
  String get saveConfigurationLoading => '儲存設定中...';

  @override
  String get no => '編號';

  @override
  String get accessGroup => '存取群組';

  @override
  String get sunday => '週日';

  @override
  String get monday => '週一';

  @override
  String get tuesday => '週二';

  @override
  String get wednesday => '週三';

  @override
  String get thursday => '週四';

  @override
  String get friday => '週五';

  @override
  String get saturday => '週六';

  @override
  String get hhmm => '時:分';

  @override
  String get contractor => '承包商';

  @override
  String get visitor => '訪客';
}
