Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569A86E8B17
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4483D10EBA6;
	Thu, 20 Apr 2023 07:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 403 seconds by postgrey-1.36 at gabe;
 Tue, 18 Apr 2023 21:38:19 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A10B10E2FC;
 Tue, 18 Apr 2023 21:38:18 +0000 (UTC)
Received: from smtp102.mailbox.org (unknown [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Q1HDH079Cz9t4K;
 Tue, 18 Apr 2023 23:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1681853487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KC9FUxhkYIrJcl9CTNIj/+D5n5jqJvE6Q6ukjUkKjgU=;
 b=iOhsPXPQBr3wHW9fEQnn1H5Xxrcndhu5PSan/o9ZRycMM4Pi+GvYMnmTNWAQLJDaCePnPl
 xk+S7Sd0u1bL5nZdJy0Oip9iNqo4aARvkS6y4jN1qn+q2fCPFi61VwvK3zG91FijKdA22h
 p7oon1un7Lgvm+DmIPno1GvR6hW2bcOpQx1KxYamqSvADPrcsxNDkSASG4ApgTSZJiZYfQ
 V08WjFMwTKAUBx/em1qvSkGDJ+FyjzUa1Fq6xrPlO+STrAYJmpTOXlTGuRIokJd4ix07/s
 fSZoQhrwFwrqQ5zQN5Z/YdcG9HuRXojtoCu0x6dzNZJNWibv1Gdx66nU8nl5fw==
Date: Mon, 17 Apr 2023 20:48:09 +0200
From: Harald Koenig <harald@mailbox.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: 2023 X.Org Foundation Membership deadline for voting in the
 election
Message-ID: <ZD2UabVlQOBVaVRO@hl.fritz.box>
References: <ef4e39301a769ef83668074c341274e30db57f95.camel@igalia.com>
 <2b861d289edaab1c53c031f72de192fcddf85b13.camel@igalia.com>
 <20230417124502.GB19964@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417124502.GB19964@pendragon.ideasonboard.com>
X-MBO-RS-META: 7gitco355spy61a3k3zmf6tukn6cq3nt
X-MBO-RS-ID: c488dba0842a997c9ba
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: xorg-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 board <board@foundation.x.org>, members@x.org, amd-gfx@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, events@lists.x.org,
 Ricardo Garcia <rgarcia@igalia.com>, freedreno@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Apr 17, Laurent Pinchart wrote:

> I don't know if I'm the only one affected by this issue, but I've just
> received today two months of e-mails from x.org, including all the
> reminders aboud membership renewal and election nomination period. This
> isn't the first time this happens, and the last time I was told there
> was no automated process to quick the mail queues when errors happen,
> making mails pile up forever on x.org's side until someone handles it
> manually. This is something you really want to automate, or at least
> monitored.

same here for me: looking into the mail header,
both mails were stuck on server "gabe.freedesktop.org" 

	Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	        by gabe.freedesktop.org (Postfix) with ESMTP id BD01310E459;
	        Mon, 17 Apr 2023 11:42:45 +0000 (UTC)
	X-Original-To: events@lists.x.org
	Delivered-To: events@lists.x.org
	Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C54510E162;
	 Wed, 15 Feb 2023 15:58:10 +0000 (UTC)

and	

	Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	        by gabe.freedesktop.org (Postfix) with ESMTP id 6735010E46D;
	        Mon, 17 Apr 2023 11:42:45 +0000 (UTC)
	X-Original-To: events@lists.x.org
	Delivered-To: events@lists.x.org
	Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DB48953E;
	 Mon, 13 Mar 2023 15:23:02 +0000 (UTC)



Harald
-- 
"I hope to die                                      ___       _____
before I *have* to use Microsoft Word.",           0--,|    /OOOOOOO\
Donald E. Knuth, 02-Oct-2001 in Tuebingen.        <_/  /  /OOOOOOOOOOO\
                                                    \  \/OOOOOOOOOOOOOOO\
                                                      \ OOOOOOOOOOOOOOOOO|//
                                                       \/\/\/\/\/\/\/\/\/
Harald Koenig                                           //  /     \\  \
harald.koenig@mailbox.org                              ^^^^^       ^^^^^
