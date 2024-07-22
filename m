Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D3939147
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 17:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FF210E0F6;
	Mon, 22 Jul 2024 15:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SF65EsGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF13210E0FA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 15:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721660626;
 bh=94V2FOBhQb+tZMxWV3mDiMf6SrdiLsoT8QBihrvghmc=;
 h=Subject:From:To:Date:From;
 b=SF65EsGmpIduA6Rwkhg5Rd6U0lDZUl/Sr6ERPWEbbaFhuh2pKSHI7Ik9oQzNVKi7B
 KlbMlGj7KJIlipf+Z0Vl2+UoJhDF4+h2f/CZQJwgamj3zxfqSauemLZWcFvsXq3kAf
 XUMHcsIvO0BotEaG6q6+Z6ibRZCZxzf69bJ9rHiaa+w2AZNhjBCmmOCr4nZMWDmAEx
 aRo9caB14MWWaBJg+RM6wsbTLJEJtSt5Us8ZhRCrx9R4G8mPz/qex4hA3+V2wf43nV
 z01c3sb4ProptVOrY04NwcutVdIPaMb6fsz9J+fL1J3Ss2K6CKgxaUdrGwTWbdEOKC
 S/7NTRyn1en2A==
Received: from [100.127.186.53] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mfilion)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 47BDF378001E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 15:03:46 +0000 (UTC)
Message-ID: <e91d7ad2d4561d1a9137373e23f78273e955b3b0.camel@collabora.com>
Subject: Reminder - The Call for Proposals is open for XDC 2024!
From: Mark Filion <mark.filion@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Mon, 22 Jul 2024 11:03:44 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
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

Reminder -=C2=A0The CfP is now open for talks, workshops=C2=A0and demos at =
XDC
2024. The deadline for submissions is Monday, 12 August 2024.

https://indico.freedesktop.org/event/6/abstracts/

While any serious proposal will be gratefully=C2=A0considered, topics of
interest to X.Org and freedesktop.org developers are encouraged. The
program focus is on new development, ongoing challenges and anything
else that will spark discussions among attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more!
=C2=A0=C2=A0=C2=A0
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

=C2=A0=C2=A0=C2=A0=C2=A0https://floss.social/@XOrgDevConf

Best,

Mark
