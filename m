Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BF702C59
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 14:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCE010E1B1;
	Mon, 15 May 2023 12:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3004 seconds by postgrey-1.36 at gabe;
 Mon, 15 May 2023 12:10:45 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F05610E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 12:10:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34F9llco004402; Mon, 15 May 2023 13:20:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dfJ4rizXxwF4addGBsh3lweiswGQlhh2D6rEKH2UdC4=;
 b=pFpAPPvElQbTHmtyduc83EhjACPOF0drACRuYsUM6mmhBSBzf7NzEHzR9kwxD8JGIz/T
 atoOVIBwL3xscNxjnRVjZ4X+43Gv59kUAS/f8hLawg0dEsksDy/h0tZYat003atIVWhJ
 H+jwZ3YHvljqgm7FsNCao83TsgZlFEoKkk7NOPVowykLrgAqY3mQPNmhS6bgYjL8PwlP
 hnanvsSwvQuTG9B4WbcQz7PcETdqyiDR9sHUC+V3J3robpI7XyL+8XU0PjYEh5GJcc1B
 0geUhVVfjBAFflqMBQSLP4bF6jcsWTti/+OdaeyCyHo+5KnedIVugnKIcnPVYusNbmMo EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qhyyh29hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 13:20:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 865E210002A;
 Mon, 15 May 2023 13:20:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5CDA8228A25;
 Mon, 15 May 2023 13:20:33 +0200 (CEST)
Received: from [10.48.0.85] (10.48.0.85) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 15 May
 2023 13:20:33 +0200
Message-ID: <7ca8a275-350b-bbb1-b5ce-e8fc61ea3085@foss.st.com>
Date: Mon, 15 May 2023 13:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] MAINTAINERS: Update Alain Volmat's email address for
 drm/sti
To: Alain Volmat <avolmat@me.com>, <arnd@arnd.de>
References: <20230416202747.62479-1-avolmat@me.com>
Content-Language: en-US
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20230416202747.62479-1-avolmat@me.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.0.85]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_09,2023-05-05_01,2023-02-09_01
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
Cc: patrice.chotard@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/16/23 22:27, Alain Volmat wrote:
> Update my email address for maintainer of the STi DRM driver.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0e64787aace8..3cec7ad72389 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6952,7 +6952,7 @@ F:	Documentation/devicetree/bindings/display/rockchip/
>   F:	drivers/gpu/drm/rockchip/
>   
>   DRM DRIVERS FOR STI
> -M:	Alain Volmat <alain.volmat@foss.st.com>
> +M:	Alain Volmat <avolmat@me.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc

Hi Alain,
Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>
Many thanks
Philippe :-)
