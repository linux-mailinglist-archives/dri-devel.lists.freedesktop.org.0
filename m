Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E67D5EF5C9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 14:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F1910E602;
	Thu, 29 Sep 2022 12:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.codeweavers.com (mail.codeweavers.com [65.103.31.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D0310E299;
 Thu, 29 Sep 2022 12:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:Content-Type:
 Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sLRVBiowlV3tgU9aNfa7uL8HAclPzQwxQlHwwavoEO4=; b=MojYtUJRl8xO+X4QxgC3u5xer8
 zhKa4ZNMN3KOOlNDjCx4QcE7qWgbUR7wngGBdOpD9qVqXXJbWVpk3VTi+dgH7gmc9C43bYkRnLHVF
 XWxmGESyyUch0KKrU3UXzf3ZGOTKfSKkaXryLOWFp6RJW2/8ESTXELWQM/mA7Y/x0+DM=;
Received: from jwhite.vpn.codeweavers.com ([10.69.141.101] helo=[10.0.0.18])
 by mail.codeweavers.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <jwhite@codeweavers.com>)
 id 1odt4P-00087X-TW; Thu, 29 Sep 2022 07:55:18 -0500
Message-ID: <0dff419f-1c40-16ba-b067-a88ba46305eb@codeweavers.com>
Date: Thu, 29 Sep 2022 07:55:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: events@lists.x.org, xorg-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org
From: Jeremy White <jwhite@codeweavers.com>
Subject: Information about XDC 2022 - next week!
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

﻿Hi folks,

We are excited to welcome you in person to the 2022 X.Org Developers 
Conference, held in conjunction with WineConf and FOSS XR conference.

The conference will start officially on Tuesday morning, October 4th. 
The program is here:
   https://indico.freedesktop.org/event/2/timetable/#all.detailed
The official events start at 8:30 am, but we will have coffee and 
pastries available from 7:30 on Tuesday and 8 on Wednesday and Thursday.

We expect everyone attending to be vaccinated and to be respectful of 
people that are trying to avoid catching COVID. Masks are mandatory, 
except when presenting or eating.

A small number of us will gather informally at Brit’s Pub, starting at 
around 4:00 pm on Monday, October 3rd.  We’ll try to have a table with 
some sort of a sign, and folks can connect, have a drink, and then 
perhaps group up to explore alternate food.  Note that if the weather is 
nice, we may be up on the roof, so explore far to find us.

We will be on the Minneapolis campus of St. Thomas, which is a mildly 
confusing campus.  We have given instructions and a picture to guide you 
here:
 
https://indico.freedesktop.org/event/2/page/10-attending-xdc-wineconf-foss-xr
We are working on the remote experience, and expect to have streaming of 
all events available. The above page will have those details just as 
soon as they are finalized.

We have a page of instructions for folks that will be presenting:
   https://indico.freedesktop.org/event/2/page/18-speaker-instructions

We are also excited to announce the happy hour taking place on 
Wednesday, from 6:00 pm until 8:00 pm.  The hope is that all three 
projects can mingle and socialize and enjoy the return of in person 
meetings.

Also, this year we plan to adopt the Wine strategy of using a deliberate 
Matrix chat room just for the conference.  Matrix has a variety of apps, 
and Element, the default one is easy to configure on many devices, 
including mobile phones.  The link to that channel is here:
   https://matrix.to/#/#xdc-wineconf-fossxr-2022:matrix.org
We find the chat channel a good place to learn what restaurants and bars 
are chosen, and just a good way to track the social aspects of the 
conference.

We look forward to seeing you next week!

Cheers,

Jeremy
