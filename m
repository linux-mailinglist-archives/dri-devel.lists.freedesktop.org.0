Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87283720681
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 17:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEF510E0C7;
	Fri,  2 Jun 2023 15:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689FE10E0C7
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 15:49:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 833A960ADF;
 Fri,  2 Jun 2023 15:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590DDC433EF;
 Fri,  2 Jun 2023 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685720990;
 bh=sD81JCVfGw5GrAwajQklx+KTHrfCGMFpdfVhxC0i//M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Y4hYtccOfJffLImhYW99zUoHwIRuNHK2Uk99GotjfnjveavW91YHggPKGx7WpTBAC
 9WNwALySC+7AndSD5EnBoIKwzL9G6Xy7/QFRpuPAnnpPBM7Qw0ZQsLZ2rB9FJiPh5E
 mopHy9tIFIb6o2nhRA+z1t7Q+3k1qJ909Y3C1x4HU3Yv22vglXV6Gx9lugX/+PH6rp
 LLSouPldp6DyKFB/GCskd80g+cHGrXDFrWhbG9PFzw57AAqtSLpQHJNlpSuCtt8vxH
 L/wZ4+CJsCXPuz6A5bhsBaZ8UHcTbmHRsKD9a+JdX0jBt2zRN+vgBcAGdnjwAAhWv7
 8AMr+8fwTaAZg==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20230531133724.133872-1-maxime@cerno.tech>
References: <20230531133724.133872-1-maxime@cerno.tech>
Subject: Re: (subset) [PATCH] mailmap: Add missing email address
Message-Id: <168572098802.2066066.15895995146589276547.b4-ty@kernel.org>
Date: Fri, 02 Jun 2023 17:49:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-878de
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 May 2023 15:37:24 +0200, Maxime Ripard wrote:
> I've been using that email address for contributions for a while but it
> seems I never added it to mailmap.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

