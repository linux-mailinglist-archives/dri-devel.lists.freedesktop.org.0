Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3BD33D1AD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 11:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB676E2EF;
	Tue, 16 Mar 2021 10:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FB26E2EF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J8trukTWC7WcdIObJdwTDVczy2dyd+ceTeeOAhoZ9XU=; b=ZQ2gZwxZCPf5snC22N4iUqhmG4
 jN22xxIvMSM+7jCUgo0Pkis1tDTAHKnsC9sZbWuxNPV0wSUBTONpnux3R4YRaxl/eCLls1W7FqE9a
 uP2FOAYOfJLIHbxcCBlNpMn07A4OrWSTeYICMawFSAEAG5I/IppcD6SXYLyTieCojQBCfo3WOb6/W
 2FGqPOpXcO6BpmkpVtQBP10CE+7gv9L5lc0ftT3AD3zjgC4hfWkKqtkuXDezYtkvvOWSvikRa4gGr
 R8/WVa2s6FSOhRmjpSnJsTmTxlWk+sFtJ0dcXxUbTkTXlaajZnQRJqqy25GxLPsmymb+IY6soC7UG
 GWAcNbFQ==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=60784)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lM6pO-0007FI-Pv; Tue, 16 Mar 2021 11:21:30 +0100
Subject: Re: Need -fixes commit in drm-misc-next
To: Maxime Ripard <maxime@cerno.tech>
References: <bc4381ab-d9c5-b425-90c5-e01d87dcb576@tronnes.org>
 <20210316090800.2ljdaroekpn3m2x5@gilmour>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <364e8cc5-3233-0c46-e8ce-3a0f698ebb72@tronnes.org>
Date: Tue, 16 Mar 2021 11:21:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316090800.2ljdaroekpn3m2x5@gilmour>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 16.03.2021 10.08, skrev Maxime Ripard:
> Hi!
> =

> On Tue, Mar 09, 2021 at 06:08:49PM +0100, Noralf Tr=F8nnes wrote:
>> Hi drm-misc maintainers,
>>
>> I have this series:
>>
>> GUD USB Display driver
>> https://patchwork.freedesktop.org/series/87044/#rev3
>>
>> That depends on this drm-misc-fixes commit:
>>
>> 3a3fe21242a3 ("drm: Use USB controller's DMA mask when importing dmabufs=
")
>>
>> I would would be nice if it would show up in drm-misc-next soon.
> =

> I pushed it earlier today
> =


Thanks Maxime!

Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
