Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE653C23A2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 14:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB396EA27;
	Fri,  9 Jul 2021 12:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49C76EA27
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 12:43:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169Cbr9d018435; Fri, 9 Jul 2021 14:43:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VjWjX8YxlPuNBcQA/W+vKbgaRTFnqXjqqNwnc9uv62s=;
 b=1LesFDrlJAIkMhVFWaarZHOP1sNhTRBTCdYqYAYbUk7SshB4BtWNENiLVKjpRgTsRYIj
 eUGU3uZit67SJxDG/d34+qMmG7hmz/fTItlo/DfnxrVlzIbMYykuq/AJJ3C6JxdyuyqH
 KHvzDyIBQ3kpaolC2tNCh7RAOOBRnbMFNyF+J0Rz1+sNdbe5ZD7clhwBBsK9XK6/dMSV
 9/NIEYATe3jXovyxs5/4nkyEb9uon5AlvToRX1/qMy6PyLRGfhKyQQAvpEUjeiIlib6n
 gw3O924H+a7p2Q94K6COMWU+n5lquRbGVxM+tKJpcdMgHv2+c4yTFwJkU6Vl7CU/LF62 cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39pe94tsvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 14:43:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4859100034;
 Fri,  9 Jul 2021 14:43:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A80632248B3;
 Fri,  9 Jul 2021 14:43:16 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 14:43:15 +0200
Subject: Re: [PATCH] MAINTAINERS: Add Raphael Gallais-Pou as STM32 DRM
 maintainer
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>, "Yannick
 FERTRE - foss" <yannick.fertre@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210708125217.11784-1-raphael.gallais-pou@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <51673f9a-2f57-237b-d67a-008a9212f7b4@foss.st.com>
Date: Fri, 9 Jul 2021 14:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708125217.11784-1-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_05:2021-07-09,
 2021-07-09 signatures=0
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
Cc: Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/8/21 2:54 PM, Raphael GALLAIS-POU - foss wrote:
> Add Raphael Gallais-Pou as STM32 DRM maintainer.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f1171ceaf8b..4fa3bfc00f57 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6165,6 +6165,7 @@ DRM DRIVERS FOR STM
>   M:	Yannick Fertre <yannick.fertre@foss.st.com>
>   M:	Philippe Cornu <philippe.cornu@foss.st.com>
>   M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
> +M:	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Hi Raphaël,
Warm welcome on board!

Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>

Note: you may have to wait and resend your patch as Benjamin sent 
recently an update too.

Many thanks
Philippe :-)


>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
> 
