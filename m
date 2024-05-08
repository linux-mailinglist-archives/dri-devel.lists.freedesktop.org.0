Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB338C0529
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 21:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82A11131AA;
	Wed,  8 May 2024 19:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="msDuQVNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF041131AA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 19:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715197122;
 bh=EMoh6ibnBlSUQl1yoaNN8vNpQ2RppWN97oATY4a6MVk=;
 h=Subject:From:To:Date:From;
 b=msDuQVNz2bGYhvqLlJ6TzpYF3OVdpzZhg5DgRFy86Gvh2+nj4gOmSZAnvl6D7ZROx
 0nJ5DWmaej6T/jZ3zRu+Tt33boTCZmFeMdUoe2DnCOlokjTkfSmlrB20vwUXkw2Ymg
 hnXz7p6bksd5GWRS+ZrAURgiIDuhvipsUE96me++5oKxikrnP7izGYzyqdO90xk5LB
 jq4gvu8tm8N94vCCPYkN0kto2Hb6X187TxNmuEulQZBL6QVv2ZzUfMv2D8ZubmrjPQ
 Zn3ecrX3i4Y+A8VUI1bZ7m2jvpOyiHB2OkG0bdEshqPMGC7ov3fnxspDXpTCx9bH2L
 R5sixh8iHOG3A==
Received: from [100.127.186.53] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: mfilion)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 872583782065
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 19:38:41 +0000 (UTC)
Message-ID: <c3aa7abb808bfca8467de057dcf553611694476b.camel@collabora.com>
Subject: 2024 X.Org Developers Conference - October 9-11,
 =?ISO-8859-1?Q?Montr=E9al=2C?= Canada
From: Mark Filion <mark.filion@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Wed, 08 May 2024 15:38:37 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
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

Hello!

We're delighted to announce that the 2024 X.Org Developers Conference
(XDC) will be taking place on October 9 to 11 in Montr=C3=A9al, Canada, co-
located with the GStreamer Conference & Hackfest 2024 which will be
running from October 7 to 10. Join us for a freedesktop week in
Montr=C3=A9al!

XDC is the event for developers working on all things Open graphics
(Linux kernel, Mesa, DRM, Wayland, X11, etc.).

New this year: XDC 2024 will feature two full days of talks followed by
a day dedicated to workshops, meetings & hacking.

XDC 2024 website: https://indico.freedesktop.org/event/6/

The in-person venue is the Concordia University Conference Centre,
located within the John Molson School of Business.

Concordia University Conference Centre
1450 Guy St., Montreal, Quebec, Canada, H3H 0A1
https://goo.gl/maps/9nDyTvKtf7X1JuJc9

As usual, XDC will be free of charge and open to the general public.

Registration & Call for Proposals will be opening soon, stay tuned!

Best regards,

Mark Filion, on behalf of X.org

