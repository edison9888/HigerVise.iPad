#import "client_search_option_relation_dal.h"

@implementation client_search_option_relation_dal

+ (NSNumber *)getMaxId
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    NSNumber *rtn;
    FMResultSet *result = [db executeQuery:@"SELECT MAX(search_option_relation_id) FROM client_search_option_relation"];
    if ([result next]) {
        int maxId = [result intForColumnIndex:0] + 1;
        rtn = [NSNumber numberWithInt:maxId];
    }
    [db close];
    return rtn;
}

+ (BOOL)exists:(NSNumber *)search_option_relation_id
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    BOOL rtn;
    FMResultSet *result = [db executeQuery:@"SELECT COUNT(search_option_relation_id) FROM client_search_option_relation WHERE search_option_relation_id = ?", search_option_relation_id];
    if ([result next]) {
        int count = [result intForColumnIndex:0];
        if (count == 0) {
            rtn = NO;
        }
        else {
            rtn = YES;
        }
    }
    [db close];
    return rtn;
}

+ (BOOL)add:(client_search_option_relation *)model
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    BOOL rtn;
    rtn = [db executeUpdate:@"INSERT INTO client_search_option_relation (search_option_relation_id, master_search_id, master_search_option_id, slave_search_id, slave_search_option_id, data_version) VALUES (?, ?, ?, ?, ?, ?)", model.search_option_relation_id, model.master_search_id, model.master_search_option_id, model.slave_search_id, model.slave_search_option_id, model.data_version];
    [db close];
    return rtn;
}

+ (BOOL)update:(client_search_option_relation *)model
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    BOOL rtn;
    rtn = [db executeUpdate:@"UPDATE client_search_option_relation SET master_search_id = ?, master_search_option_id = ?, slave_search_id = ?, slave_search_option_id = ?, data_version = ? WHERE search_option_relation_id = ?", model.master_search_id, model.master_search_option_id, model.slave_search_id, model.slave_search_option_id, model.data_version, model.search_option_relation_id];
    [db close];
    return rtn;
}

+ (BOOL)delete:(NSNumber *)search_option_relation_id
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    BOOL rtn;
    rtn = [db executeUpdate:@"DELETE FROM client_search_option_relation WHERE search_option_relation_id = ?", search_option_relation_id];
    [db close];
    return rtn;
}

+ (BOOL)deleteList:(NSString *)where
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    BOOL rtn;
    NSString *strSql = [NSString stringWithFormat:@"DELETE FROM client_search_option_relation WHERE %@", where];
    rtn = [db executeUpdate:strSql];
    [db close];
    return rtn;
}

+ (client_search_option_relation *)get:(NSNumber *)search_option_relation_id
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    client_search_option_relation *rtn;
    FMResultSet *result = [db executeQuery:@"SELECT * FROM client_search_option_relation WHERE search_option_relation_id = ?", search_option_relation_id];
    while ([result next]) {
        rtn = [[client_search_option_relation alloc] init];
        rtn.search_option_relation_id = [NSNumber numberWithInt:[result intForColumn:@"search_option_relation_id"]];
        rtn.master_search_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_id"]];
        rtn.master_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_option_id"]];
        rtn.slave_search_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_id"]];
        rtn.slave_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_option_id"]];
        rtn.data_version = [NSNumber numberWithInt:[result intForColumn:@"data_version"]];
        break;
    }
    [db close];
    return rtn;
}

+ (NSArray *)getList:(NSString *)where
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *strSql = [NSString stringWithFormat:@"SELECT * FROM client_search_option_relation WHERE %@", where];
    FMResultSet *result = [db executeQuery:strSql];
    while ([result next]) {
        client_search_option_relation *rtn = [[client_search_option_relation alloc] init];
        rtn.search_option_relation_id = [NSNumber numberWithInt:[result intForColumn:@"search_option_relation_id"]];
        rtn.master_search_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_id"]];
        rtn.master_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_option_id"]];
        rtn.slave_search_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_id"]];
        rtn.slave_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_option_id"]];
        rtn.data_version = [NSNumber numberWithInt:[result intForColumn:@"data_version"]];
        [array addObject:rtn];
    }
    [db close];
    return array;
}

+ (NSArray *)getList:(NSString *)where order:(NSString *)order
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *strSql = [NSString stringWithFormat:@"SELECT * FROM client_search_option_relation WHERE %@ ORDER BY %@", where, order];
    FMResultSet *result = [db executeQuery:strSql];
    while ([result next]) {
        client_search_option_relation *rtn = [[client_search_option_relation alloc] init];
        rtn.search_option_relation_id = [NSNumber numberWithInt:[result intForColumn:@"search_option_relation_id"]];
        rtn.master_search_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_id"]];
        rtn.master_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_option_id"]];
        rtn.slave_search_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_id"]];
        rtn.slave_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_option_id"]];
        rtn.data_version = [NSNumber numberWithInt:[result intForColumn:@"data_version"]];
        [array addObject:rtn];
    }
    [db close];
    return array;
}

+ (NSArray *)getList:(NSString *)where order:(NSString *)order top:(NSInteger)top
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *strSql = [NSString stringWithFormat:@"SELECT * FROM client_search_option_relation WHERE %@ ORDER BY %@ LIMIT 0,%d", where, order, top];
    FMResultSet *result = [db executeQuery:strSql];
    while ([result next]) {
        client_search_option_relation *rtn = [[client_search_option_relation alloc] init];
        rtn.search_option_relation_id = [NSNumber numberWithInt:[result intForColumn:@"search_option_relation_id"]];
        rtn.master_search_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_id"]];
        rtn.master_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_option_id"]];
        rtn.slave_search_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_id"]];
        rtn.slave_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_option_id"]];
        rtn.data_version = [NSNumber numberWithInt:[result intForColumn:@"data_version"]];
        [array addObject:rtn];
    }
    [db close];
    return array;
}

+ (NSArray *)getList:(NSString *)where order:(NSString *)order beginIndex:(NSInteger)beginIndex length:(NSInteger)length
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *strSql = [NSString stringWithFormat:@"SELECT * FROM client_search_option_relation WHERE %@ ORDER BY %@ LIMIT %d,%d", where, order, beginIndex, length];
    FMResultSet *result = [db executeQuery:strSql];
    while ([result next]) {
        client_search_option_relation *rtn = [[client_search_option_relation alloc] init];
        rtn.search_option_relation_id = [NSNumber numberWithInt:[result intForColumn:@"search_option_relation_id"]];
        rtn.master_search_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_id"]];
        rtn.master_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_option_id"]];
        rtn.slave_search_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_id"]];
        rtn.slave_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_option_id"]];
        rtn.data_version = [NSNumber numberWithInt:[result intForColumn:@"data_version"]];
        [array addObject:rtn];
    }
    [db close];
    return array;
}

+ (NSArray *)getList:(NSString *)where order:(NSString *)order page:(NSInteger)page pageSize:(NSInteger)pageSize
{
    NSString *dbPath = [BaseInfo getDataBasePath];
    FMDatabase *db = [[FMDatabase alloc] initWithPath:dbPath];
    [db open];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSInteger beginIndex = (page - 1) * pageSize;
    NSInteger length = pageSize;
    NSString *strSql = [NSString stringWithFormat:@"SELECT * FROM client_search_option_relation WHERE %@ ORDER BY %@ LIMIT %d,%d", where, order, beginIndex, length];
    FMResultSet *result = [db executeQuery:strSql];
    while ([result next]) {
        client_search_option_relation *rtn = [[client_search_option_relation alloc] init];
        rtn.search_option_relation_id = [NSNumber numberWithInt:[result intForColumn:@"search_option_relation_id"]];
        rtn.master_search_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_id"]];
        rtn.master_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"master_search_option_id"]];
        rtn.slave_search_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_id"]];
        rtn.slave_search_option_id = [NSNumber numberWithInt:[result intForColumn:@"slave_search_option_id"]];
        rtn.data_version = [NSNumber numberWithInt:[result intForColumn:@"data_version"]];
        [array addObject:rtn];
    }
    [db close];
    return array;
}

+ (client_search_option_relation *)convertJsonToModel:(NSDictionary *)json
{
    client_search_option_relation *model = [[client_search_option_relation alloc] init];
    model.search_option_relation_id = [json objectForKey:@"search_option_relation_id"];
    model.master_search_id = [json objectForKey:@"master_search_id"];
    model.master_search_option_id = [json objectForKey:@"master_search_option_id"];
    model.slave_search_id = [json objectForKey:@"slave_search_id"];
    model.slave_search_option_id = [json objectForKey:@"slave_search_option_id"];
    model.data_version = [json objectForKey:@"data_version"];
    return model;
}

+ (NSArray *)convertJsonToList:(NSArray *)jsons
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *json in jsons) {
        client_search_option_relation *model = [[client_search_option_relation alloc] init];
        model.search_option_relation_id = [json objectForKey:@"search_option_relation_id"];
        model.master_search_id = [json objectForKey:@"master_search_id"];
        model.master_search_option_id = [json objectForKey:@"master_search_option_id"];
        model.slave_search_id = [json objectForKey:@"slave_search_id"];
        model.slave_search_option_id = [json objectForKey:@"slave_search_option_id"];
        model.data_version = [json objectForKey:@"data_version"];
        [array addObject:model];
    }
    return array;
}

@end