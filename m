Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF9AFD974
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 23:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E31810E075;
	Tue,  8 Jul 2025 21:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZamDFZxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C025810E075
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 21:16:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E06745C5B94;
 Tue,  8 Jul 2025 21:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDE2C4CEED;
 Tue,  8 Jul 2025 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752009380;
 bh=ltXtFs+FCm7kdZYRy8gh9v9vkGeWsCBaQ7k3C/UgmI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZamDFZxoUKnJ50jqbuzf+mtCNimN+KnRAHw02TOqvhnP7JYLwu3iAIRak9q6CbuPh
 Tm9NOOK+IZHdF5YxaVfKzqX1iIO2C1Z7g0G3jF9kByA5pHxPC6eYvpOghY9g2l38Uc
 w6Rks0L2Jkv3BPhcEOCglupnmTsLWTlO1Y5VQRlohfL1xXRb9d7Z48jJg4wI2cEhaj
 tZkl0Qtt9tBtM0J/DL3tFlV8Z+VMViPe8aGypq9UF4oa4fwtZmWITcuJURdpQNICfo
 pZ7ioh1TlUXff8RrD64B5n074XRUvpNFkKeXaHqy/Ck1GNwRpcScus2WLD9/yDMR0l
 pNMVwtdwZuRyg==
Date: Tue, 8 Jul 2025 16:16:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Wig Cheng <onlywig@gmail.com>,
 devicetree@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
Message-ID: <175200937878.1039013.16279385818262913331.robh@kernel.org>
References: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
 <20250708-drm-v1-1-45055fdadc8a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-drm-v1-1-45055fdadc8a@gmail.com>
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


On Tue, 08 Jul 2025 18:06:44 +0800, LiangCheng Wang wrote:
> From: Wig Cheng <onlywig@gmail.com>
> 
> Mayqueen is a Taiwan-based company primarily focused on the development
> of arm64 development boards and e-paper displays.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

