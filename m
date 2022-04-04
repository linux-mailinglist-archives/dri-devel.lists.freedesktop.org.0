Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F894F1926
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B7510E203;
	Mon,  4 Apr 2022 16:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF6910E203
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 16:04:15 +0000 (UTC)
Date: Mon, 04 Apr 2022 16:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649088253;
 bh=MNQPsaRTdNuR6i4bvVbc9kz9CWRg9mt2GHJ95iZJ/wA=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=wQnCPUjpj6cP3utbMDMHFF7wWTlKWwC6I0AI/cjjoQMicMl9JPEZk/nvRXACkrvqe
 lyHsbub9wAoJhDJRRnuBaI8H/cA8L+LYH6AV2KCkWFXHPfxeOu9DT385NJmrPcfuKB
 KSDkGE2hoic9aV+z6T5am+mq+bWdioToldhcyYYnA45OW6e0G+/bpS9yfiY8twHoBR
 nx6fjwdfNWNDxLk/KxlC/J2bBzwyVMBNvnygvg29cT2CCZvLW0KRpKsMdp8CmaZUod
 b3f4Wkwh5VoQJixn6JdEXLOlGYU9vF8T37VcVaMyr7/RH5zX/WO5iuvihP0TruEGlA
 nApKLK1Jgad2g==
To: Randy Dunlap <rdunlap@infradead.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/format_helper: fix a kernel-doc typo
Message-ID: <ttcrpLw9HkdhAH5SkXylXDBi9SBf7LWgOeW09ZvTF4U4_zKJAOXBQZlFxfw6NKY0Hip6dXBFape6zkX09cstuOno72c-c00wmZ_VbNDg6xs=@emersion.fr>
In-Reply-To: <20220403232902.1753-1-rdunlap@infradead.org>
References: <20220403232902.1753-1-rdunlap@infradead.org>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both doc patches pushed, thanks. I had to manually edit them because they
wouldn't apply cleanly. Next time, please use git-send-email (see
https://git-send-email.io/ for setup instructions).
