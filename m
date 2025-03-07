Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4AAA56520
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 11:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE19310EB39;
	Fri,  7 Mar 2025 10:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S3t+BCk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F292510EB38
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 10:24:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8427C5C599E;
 Fri,  7 Mar 2025 10:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A0AC4AF0B;
 Fri,  7 Mar 2025 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741343074;
 bh=Djv5FfsTg2UX6dg4OBS0LDjluXA5XJF6DZ9+8Th4zzg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=S3t+BCk9NLYTS7XjOhYLrvBE1N4GNvPKIldIC1/0Qp6NWEM2GKbT2J25uBb2Crc7L
 H8A4DpxOooZRRBaszTC6uQnUl0ixVql/Q8ydxXiCTGu3clxD+U4pbb9LVzuJXzfQlJ
 qvPy62eA0Zm+rJElabY8L4eZ5METZJEaKVsq97B7nzHSNN53om/abizHKPjSyCk2rj
 y3HXIUPtuhxyfObvWGrL6Yge/43X8o6CO3HkGgSLF8q/QdMf8+JU3kIY3qv/zs45v1
 MiXgOzBezKkFpVtFFnGMM/kQATct5dX7EOjagStffN2fNVxtf4sbwSVf22As7SuKtJ
 CoqtIeM8MxT5g==
Message-ID: <249fa2f35689b1b2914ada0179c73e6c@kernel.org>
Date: Fri, 07 Mar 2025 10:24:31 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH] drm/vkms: Add "hardware limitation" emulation TODO
In-Reply-To: <20250225-vkms-update-todo-v1-1-afb1e6f7d714@bootlin.com>
References: <20250225-vkms-update-todo-v1-1-afb1e6f7d714@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, "David
 Airlie" <airlied@gmail.com>, "Haneen Mohammed" <hamohammed.sa@gmail.com>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Melissa Wen" <melissa.srw@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Tue, 25 Feb 2025 16:46:22 +0100, Louis Chauvet wrote:
> Add the hardware limitation todo.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
