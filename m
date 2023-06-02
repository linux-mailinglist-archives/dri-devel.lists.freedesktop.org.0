Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB97720A76
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 22:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314D710E0FB;
	Fri,  2 Jun 2023 20:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB45310E0F0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 20:40:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352DuFJf005995; Fri, 2 Jun 2023 20:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9+03auotNTz1TIZFlXasLKcdBNaehKED/ltJTzRkCCM=;
 b=ck4BSOKDv958p3nZdyRLrQd0zBhueNGhzVUGik6DM9u57cZ3dDYjLjyksWPJOue3epL0
 eXOvBYppxYTifduXuDmwcwGdf1LuxY/dW6DAGQLNRi2f+m339MIiaP5YoPK4vzX6lzGz
 Y/uzHr7SpUXx1xqQYuVhRKpL5mxbMzOJj1VXKg/gysE0BhFFfaX0t+DwrgXNi5CkRAAV
 1GfVupqDWINzG6Zh5DPb1G2tYxiGFgdOQbaY3B2g2bBOZT7YuLtd0nMP6cEb4eNP4dXH
 uDBwB4ypiillYTIMzuQPCDkWWuuSPPaEkSkgqgKOA9/l7jj9h3/oqqGy0ZPwm/yCsceo RQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qydr5heyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jun 2023 20:40:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352Keahr005559
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jun 2023 20:40:36 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 2 Jun 2023
 13:40:35 -0700
Message-ID: <e5044160-ebc8-b1e7-a944-33cd1b080eb3@quicinc.com>
Date: Fri, 2 Jun 2023 14:40:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] MAINTAINERS: Add Carl/Pranjal as QAIC reviewers
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>
References: <20230523161421.11017-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230523161421.11017-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: NnAsRHPj8jLvNMlxwd8fmTl8hEIf8nKF
X-Proofpoint-GUID: NnAsRHPj8jLvNMlxwd8fmTl8hEIf8nKF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_16,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=891 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020160
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

On 5/23/2023 10:14 AM, Jeffrey Hugo wrote:
> Carl and Pranjal have been reviewing the QAIC patches.  List them as
> reviewers so that they are copied on all developments which will make
> it easier for them to continue reviewing QAIC patches.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Applied to drm-misc-next
