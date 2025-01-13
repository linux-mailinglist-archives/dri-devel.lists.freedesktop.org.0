Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB75A0B07F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF49510E411;
	Mon, 13 Jan 2025 08:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="k+CPWULH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B17F10E411
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1736755531; x=1737014731;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=k+CPWULHqip96yEYi2/6lgUgfMjaD6djTF6caPwf4LlCMXgSL09pcDCKAApW7xdw+
 gKqkCfYbOeD8W/iUiBrU8tOrpUl1QjjwG8ClbomDBfzMzj6mNxSuqzwPeDu3w0mQRn
 JOexvuLdHIUnG7djT4RLS4I5FkLPONP9KIUnqA5bwrdrdRfdcaE7IJvlar5MgMk24Z
 Ucd+nOMZcySKAmMEY79t+bSeGXGViLhksSE7PnWha64K/2NE1J40GEnk1an7Ly1Smy
 4W+p0T47oYkyGtbhOi0YKJ4b9L0nd+NOYtiGn+kzojzagsm+2p0UEl70Z8ArP14EOu
 MUk++UPiW4mzg==
Date: Mon, 13 Jan 2025 08:05:27 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 06/45] drm/colorop: Add TYPE property
Message-ID: <EYntfhyLzzsRJJm0osU7xxZ0k4EUfUdx8RsJyATqZ3romaSQqfG0QGUtwY6s1N9MXlF5BBCoudhL9jxV05XnRz3HNnd2r2UB5gtzfaGkLwQ=@emersion.fr>
In-Reply-To: <20241220043410.416867-7-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-7-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 1327e3427fd90e1dbc35c4d99aae544ed9bb90d0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Reviewed-by: Simon Ser <contact@emersion.fr>
