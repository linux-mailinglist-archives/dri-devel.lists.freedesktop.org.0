Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017F58BE829
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ACB10F669;
	Tue,  7 May 2024 16:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="LCRfNwUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0856110F669
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1715097861; x=1715357061;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=LCRfNwUJcfxw8j5uQkm8O7ZAAUE7E/wYfXATKO1eIehjOLJdumGkVyvTLnVJQQ7Hs
 uuKLoFcX8MpDLfuxKURyOnxwpDpWPdmRv83N6FMihU3EBOXAnH9FgqRBKPwVf8D2+U
 jGtBxNxq2EeYfqfwJum/3nPXyFhulaTpDet2N826eQFIUxt+Od+QuGdXP1isan9/qZ
 q/HnmMTT+aVa6ZERRlwNOREKwcUVvehwKbGN9osRCztN4LYQcf+cZ4AB0sZyn48dBf
 UPwngKdXYb6uPxkWPphGHtOGm3hR0QiMBw9UqF/n45J0bBHN0Mf2UMBpS6o0Lq0JZW
 PWG7RYGLta3xg==
Date: Tue, 07 May 2024 16:04:16 +0000
To: Douglas Anderson <dianders@chromium.org>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/connector: Add \n to message about demoting connector
 force-probes
Message-ID: <7lwNFVPA030n26PAZv7ytBIPJ0TF5vhOTJ-3zO8Dv-b9Qeq2VIuvkdO02CIVPpi1_yK5LhMps0XXxoHayuziNAX8qO4Lh46JD67uI1Bih3M=@emersion.fr>
In-Reply-To: <20240502153234.1.I2052f01c8d209d9ae9c300b87c6e4f60bd3cc99e@changeid>
References: <20240502153234.1.I2052f01c8d209d9ae9c300b87c6e4f60bd3cc99e@changeid>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: e017d48aa9559bc79337b2e7433d51f8970bb030
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
