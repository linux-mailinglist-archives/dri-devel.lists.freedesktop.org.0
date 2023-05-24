Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D404570F050
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 10:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE7D10E5A8;
	Wed, 24 May 2023 08:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C692710E578
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 05:49:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34O4qKbv009344; Wed, 24 May 2023 05:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jH6k5jL6r+CV1GnNCQGqg7JzqSuVnGHXD7vJeZxi2XE=;
 b=L50owDTEv8n4fuIVrWdeXRLxcBiB80d1bHb9+ZjXfySJCc5wU3NDxfy+GC6PgIIXSFeh
 LBwiyiMKjzsuIi7SUIDeRGm5uavOH7LmmTaa1cyyMy49SLeeq8LIztS4d9p4uuy2U8+L
 F2hrv0e4N8ogLS3MtNePS1v5c+VLygHO5/xnYQmGbcWUrCwUS0CPDtJTErPXT4qUIgWN
 l/yjZ6Stokpcm0k18t6T3SFiORwn5e5/v4CDJpP4yfyV3wxMOZH+KgLDXdA71Lx8OERu
 H7t6CLSrFAqOqRagPg0Ud7rOteEUUnOdHgRm7b/1V5llUoswVSGNzjKx3k6lcudhhCm/ 5w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsa0v892y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 05:49:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34O5mwnX007352
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 05:48:58 GMT
Received: from [10.79.212.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 23 May
 2023 22:48:56 -0700
Message-ID: <fe799914-135c-0adc-5bec-98b3c561d2c7@quicinc.com>
Date: Wed, 24 May 2023 11:18:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] MAINTAINERS: Add Carl/Pranjal as QAIC reviewers
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>
References: <20230523161421.11017-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <20230523161421.11017-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IC0qw8z8Cwd4VJd1gabEdZdqxCyOYBgz
X-Proofpoint-ORIG-GUID: IC0qw8z8Cwd4VJd1gabEdZdqxCyOYBgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_02,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240049
X-Mailman-Approved-At: Wed, 24 May 2023 08:10:24 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/23/2023 9:44 PM, Jeffrey Hugo wrote:
> Carl and Pranjal have been reviewing the QAIC patches.  List them as
> reviewers so that they are copied on all developments which will make
> it easier for them to continue reviewing QAIC patches.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e0b87d5aa2e..a0ec9ee090a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17381,6 +17381,8 @@ F:	include/dt-bindings/clock/qcom,*
>   
>   QUALCOMM CLOUD AI (QAIC) DRIVER
>   M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
> +R:	Carl Vanderlip <quic_carlv@quicinc.com>
> +R:	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>   L:	linux-arm-msm@vger.kernel.org
>   L:	dri-devel@lists.freedesktop.org
>   S:	Supported

ACK

Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
