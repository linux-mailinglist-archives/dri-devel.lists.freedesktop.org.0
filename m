Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C927F7198
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E36310E19F;
	Fri, 24 Nov 2023 10:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6E410E19D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:36:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 42E20B83008;
 Fri, 24 Nov 2023 10:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4786EC433C7;
 Fri, 24 Nov 2023 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700822187;
 bh=dwvET0tU2J4anZFCWNw+ZZdWZ1IJPa1GnEWhl08aDOY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=MM9kpBK+yisLDCYJftMOvpfpu6pOA725LB5EXxmwkvXFqByoAqaB5X89kowP4w0yj
 zb681yXDg8hPDrvyYZXlz+nWipEQ6BGPdt591lhsL/JTR6pU7IR/QBTw4RlUo3UEPm
 vC/kRYKYyX83Sxk689k6xefJdd68JBlWNtrjZSm0ry5RNYhbAkWK9NQxctEyrvjMr4
 xbnGOxoOeDpcJBhVIHprlpn+i0ZjjweSibtSihYi81RQOfNUP9N4xSSsnH+q/ioJtn
 8T5MLJWcclvP5CfJY/zAbPj04zqAUA2KCtIClU2XCyjdsjl0WzOhFsK6Bs5ZQJXnsu
 xRJE8DkkXQncQ==
Message-ID: <f27d3ba73b506111583b2a4f2471dfc9.mripard@kernel.org>
Date: Fri, 24 Nov 2023 10:36:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Osipenko" <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 03/26] drm/shmem-helper: Make all exported symbols GPL
In-Reply-To: <20231029230205.93277-4-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-4-dmitry.osipenko@collabora.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Melissa Wen <mwen@igalia.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Gerd
 Hoffmann <kraxel@redhat.com>, kernel@collabora.com, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 02:01:42 +0300, Dmitry Osipenko wrote:
> Make all drm-shmem exported symbols GPL to make them consistent with
> the rest of drm-shmem symbols.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
