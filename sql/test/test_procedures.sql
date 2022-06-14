
CALL sp_GetFollowedProposalsByMember(1, @result_row_num);
SELECT @result_row_num;

CALL sp_RegisterMember(
    'crowdfounding@gmail.com',
    '8289accdb1b78edc0aaeb74e4b0091430fe74f7334f54314bc395f0ad4e95d59',
    '#sviR91Ve@',
    '穆姿赭',
    '桃園市中壢區中大路300號',
    '09126543982',
    @affected_row_num);
SELECT @affected_row_num;

CALL sp_UpdatePwd(
    11,
    'd4273a1c226113fd2bbe3bcf72a7dcb9b9d5f3f31c3e51d0e786b4bdd11d08dc',
    '#sviR91Ve@',
    @affected_row_num);
SELECT @affected_row_num;

CALL sp_Login(
    'crowdfounding@gmail.com',
    'd4273a1c226113fd2bbe3bcf72a7dcb9b9d5f3f31c3e51d0e786b4bdd11d08dc',
    @status_code);
SELECT @status_code;

CALL sp_GetProposalsByKeyword('樂', @result_row_num);
SELECT @result_row_num;

CALL sp_UpdateProposalStatus(8, 2, @affected_row_num);
SELECT @affected_row_num;

CALL sp_GetHistorySponsorByMember(1, @result_row_num);
SELECT @result_row_num;

CALL sp_GetUnrepliedComments(7, @result_row_num);
SELECT @result_row_num;

CALL sp_GetProposalByCompletionRate(0.5, @result_row_num);
SELECT @result_row_num;

CALL sp_CreateProposal(
    11,
    '好睏枕【讓你好好睏】脖子的溫柔靠山，釋放你的壓力與電力｜一夜好眠不是夢',
    '台灣有超過20萬以上的人有睡眠障礙，你是不是也是其中一員？經常睡不好、睡不飽、醒來卻還是滿身疲累，一夜好眠成了一種奢求。...',
    '100000',
    1,
    @affected_row_num);
SELECT @affected_row_num;

CALL sp_GetRecommendedProposals(10, @result_row_num);
SELECT @result_row_num;

CALL sp_DeleteMember(11, @affected_row_num);
SELECT @affected_row_num;

