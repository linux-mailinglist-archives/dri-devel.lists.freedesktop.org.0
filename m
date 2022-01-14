Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFB748E6EF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AB110E1E3;
	Fri, 14 Jan 2022 08:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACA310E1E3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:53:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E6PDAM006968;
 Fri, 14 Jan 2022 09:53:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gtiMw+AjYwKRQijtvO+tqdQ46WboA1+9BaWCAalpETA=;
 b=N3hjNMJLw4PAcChzVe0eLdgwzS+KbmOdH4FVDZdu0TfjSF5BWfh9DsvnlwCNqg7ACsGI
 WDqR0eej8fCLz9KXayX9esqP5bUia7ARSZrceTeaR42n1fCwUUSfSQ22oeOxLDrdNwzW
 pDYWT0YOlnbDrZepNuMOp5jBrkGxwyfWSBGMNuVoC3iosG1X1k40mX6yBRA0Nlk6ddeJ
 liT+aTJW05KeFxzuQTjSLZND0zEtqlC+NaoZM3HPskjLLGel1nv9F6Rr4WnwdtZsVIN5
 U2eTAieduxMsqETheEo/GQ4KhAYtvCS1qnE4MInTYXw1ukeG4uJjlAamryF1lcshIJUX dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dk3vygrqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 09:53:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1663710002A;
 Fri, 14 Jan 2022 09:53:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B10520ED1F;
 Fri, 14 Jan 2022 09:53:05 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 14 Jan
 2022 09:53:03 +0100
Subject: Re: [PATCH 1/2] MAINTAINERS: Update Benjamin Gaignard maintainer
 status
To: Arnd Bergmann <arnd@arndb.de>
References: <20220113171921.17466-1-philippe.cornu@foss.st.com>
 <20220113171921.17466-2-philippe.cornu@foss.st.com>
 <CAK8P3a0Nn3fwEMtb9f0DZhbyY+mLva5XR332XfXqX=WSmB9a8w@mail.gmail.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <0733379c-65b7-c9a8-4dc5-c84502426e9f@foss.st.com>
Date: Fri, 14 Jan 2022 09:53:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0Nn3fwEMtb9f0DZhbyY+mLva5XR332XfXqX=WSmB9a8w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_03,2022-01-13_01,2021-12-02_01
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
Cc: David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Laura Abbott <labbott@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 linaro-mm-sig@lists.linaro.org, SoC Team <soc@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Christian Konig <christian.koenig@amd.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/14/22 1:45 AM, Arnd Bergmann wrote:
> On Thu, Jan 13, 2022 at 6:19 PM Philippe Cornu
> <philippe.cornu@foss.st.com> wrote:
>>
>>   DRM DRIVERS FOR STI
>> -M:     Benjamin Gaignard <benjamin.gaignard@linaro.org>
>>   L:     dri-devel@lists.freedesktop.org
>>   S:     Maintained
>>   T:     git git://anongit.freedesktop.org/drm/drm-misc
> 
> If there is no longer a maintainer, I suppose it should also be marked as
> 
> S: Orphaned
> 
>           Arnd
> 


Hi Arnd,
I sent a serie of 2 patches containing first the original/unmodified 
patch from Benjamin (see [1]) + a new patch to avoid this "orphaned 
driver" situation.

Many thanks
Philippe :-)

[1] 
https://lore.kernel.org/lkml/20210706163033.795805-1-benjamin.gaignard@collabora.com/
