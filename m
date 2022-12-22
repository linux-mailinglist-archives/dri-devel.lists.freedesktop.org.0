Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05452653DBA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 10:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD81710E182;
	Thu, 22 Dec 2022 09:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EF210E182
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 09:46:57 +0000 (UTC)
Date: Thu, 22 Dec 2022 09:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1671702414; x=1671961614;
 bh=o4JeQC4lgkRxJjuokfNcEDFkwXkl10oVBWPrONTTxh4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Fb7xGHaMJzijXz+01bGkDxjdncd+TJc7dozXVdqW0kEZ2lCBDn2pnI4Nxmcb8Kf1d
 NQHmDPjkyGKnTVHtQhPNWRO9oRUSj6sLt9rq3TqY9buS7MBj04WEJ/9EH1Tq3aY8ye
 NsSfWD5a2VGnC0U2DPVJcDZVA2++caAx/PR4fo3/6q99B6sMF5O3MCiZqLP7EB0KsA
 3XdziExN5258GefdLHgvToDJ8s+2+QZXokDURmm64OFGxOn5EYvAdewFp/GXaMj6a7
 7ORhb7QwF8xY2BHmYQJuF4kYL3FMZ9WWoNfbheymLZTq+ilgLLuFjJc6FLWGQWjwtN
 ZIHLJ0e95RjPg==
To: Siddh Raman Pant <code@siddh.me>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 09/10] drm/drm_blend: Remove usage of deprecated
 DRM_DEBUG_ATOMIC
Message-ID: <gVqAatNcTgp2XXpPwlFMezMo6sMlpbJKyR6Lhwhn3btzL0o8Y_pK-3Zh8iFTkrSl5PGgLUBX8EeAReikGeqNppc_BeHuDUvP2D4Mn2dD_ag=@emersion.fr>
In-Reply-To: <adf001582998535f212cf93e0fa35ed34358301a.1671566741.git.code@siddh.me>
References: <cover.1671566741.git.code@siddh.me>
 <adf001582998535f212cf93e0fa35ed34358301a.1671566741.git.code@siddh.me>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is:

Reviewed-by: Simon Ser <contact@emersion.fr>
