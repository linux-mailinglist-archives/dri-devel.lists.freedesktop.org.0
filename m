Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD91996E1E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FDB10E75C;
	Wed,  9 Oct 2024 14:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ci0AqRdo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5D110E75C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:34:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B89055C5F3F;
 Wed,  9 Oct 2024 14:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20851C4CEC3;
 Wed,  9 Oct 2024 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728484493;
 bh=zUlzgSRBDQAeQp1QEzRz2gKgmAyKTwQlGZzzWkS8Ghs=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ci0AqRdo5Zz7nDJvJZJut3FmMBJfsUZbz1NHxADUhqHPLzVuLlS55CJSfyi5h81Mr
 dRNhXeUo5hGBETwh44hr9hVOt50pzTuu7GIQSWVdNZAiyHWc1tptmeZnSX01UjMiwx
 5ukUa6LPv9LONZvMhE4pqFATzPXz/nlAUxy4TdqWdsjfWPl3PSKBlfhdHrME2yaDCW
 daWBtLi6bg96QiqurKkOR2wNq2vR7BLoMvfftqWFy5zScVr+11eiFI1GeRTedo4cPx
 TX7dfbQ92noVgycazv3VZgsnAfMBls0Wh9XFpo3LnBC92+YGniHaE4ZK74TJ6XoRAW
 nsluRO54LqFXQ==
Message-ID: <234c4943c9869d0feb50afcac53619be@kernel.org>
Date: Wed, 09 Oct 2024 14:34:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Add =?utf-8?b?TWHDrXJh?= to VC4 reviewers
In-Reply-To: <20241009141240.1948482-1-mcanal@igalia.com>
References: <20241009141240.1948482-1-mcanal@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "Maxime
 Ripard" <mripard@kernel.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>
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

On Wed, 9 Oct 2024 11:12:05 -0300, Ma=C3=ADra Canal wrote:
> Although I don't hold expertise on the display side of VC4, I'd like to
> help reviewing patches that are related to the 3D side of the VC4 driver.
> As V3D maintainer, I hold some expertise with Broadcom GPUs and I'm
> constantly testing kernels on RPi 3-5.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
