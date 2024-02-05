Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19859849743
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 11:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F1310F2F7;
	Mon,  5 Feb 2024 10:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="pVGbEVLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F69410F4F0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1707127408; x=1707386608;
 bh=dJZln88lN2ZOtbXwmt+yMlSaTT1Nk8VC901yTzLI2ig=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=pVGbEVLq64Z72QK2ASwQL+a1FKRnyfWznXBq7pVrsdsnXTSS67Y+BojhI3gpgEPXN
 /N19cIicqzVUdErhaeM/T2TBVMU8l5OXGRZGvzxPc1pb292wlew1Dm4rm3Fm3Y6WCr
 /yLOAKpq01CtV0eYvrCFnkg/KUDzxllY/TiS4DBqoQB1Hva0CwtDHwFhIeEq8y4IVu
 +HbUvCswtbLeyeYa5eSFGlvsb/W+POWlZVHwgcW0DK53uE3C/G852u8EI6faW+EeTC
 5qE3JTM1wK1NwwORpOViAuKO3u2eDo8iMezEjU917jE2VAtNu+115LbneylK6D+DHf
 TAeEBHXjOD4FA==
Date: Mon, 05 Feb 2024 10:03:06 +0000
To: Randy Dunlap <rdunlap@infradead.org>
From: Simon Ser <contact@emersion.fr>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/rect: fix kernel-doc typos
Message-ID: <4PPACX1VSbdsr3LqjGlbIvjHczzD8WBgJV7t9XoTUyyQxehNIEoEgNj8zYfoHeBxTg-Gu4fS73BaUzArHply-sDFqZK9y-kHEwZ7hQKJ51s=@emersion.fr>
In-Reply-To: <20240205054101.27929-1-rdunlap@infradead.org>
References: <20240205054101.27929-1-rdunlap@infradead.org>
Feedback-ID: 1358184:user:proton
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

Pushed to drm-misc-next, thanks!
