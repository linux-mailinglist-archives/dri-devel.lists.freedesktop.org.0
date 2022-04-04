Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552274F1126
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 10:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6512410EB16;
	Mon,  4 Apr 2022 08:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E3510EB16
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 08:45:30 +0000 (UTC)
Date: Mon, 04 Apr 2022 08:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649061928;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=DtFqNO/NWFzU8aLGlxKwXWWmvBgwtdE+VXtqM5MGCp0/pkgXeIpmxjBQ6FdRsVI0n
 NT59HleMtIPBpUjqr0pqpxMj0WwxyIVEbsviCp7cYzZKWU0ykX0m9KfzzwPeOyb5b2
 t1edkcD5DVpuS+8LT4jFfT1+z6sC90w/0Jm1cqP+5vipuPS16pbcRaNQRssn8X0rUL
 uP4sAVGa8XZyVGY17r+bIEyc4QjfbYuQSGDcEiop1f/gG4ZgKHHIvXQLhF0WzYEuKr
 wjOrFSI5SSyvBX/FK8siHQaCsWgO/O2RKlm9yvi00QteSRfaxixC1TDTcyuH/+b1VG
 tPtx/mbL0kIrQ==
To: Randy Dunlap <rdunlap@infradead.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/format_helper: fix a kernel-doc typo
Message-ID: <WPKnaTQnAiZoRATAyNFQMUiR7WhM5qpABAiSRl9R0SFoqf6HGqn8s0wcmrGY1zuU9vxz094jfYmfQgwdYlL2g-sPbFG8ILwk-_6aOiLiT14=@emersion.fr>
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

Reviewed-by: Simon Ser <contact@emersion.fr>
