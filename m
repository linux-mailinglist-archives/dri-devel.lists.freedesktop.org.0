Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC67FBAAD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5FA10E509;
	Tue, 28 Nov 2023 13:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B0E10E509
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:00:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1FB8BB83657;
 Tue, 28 Nov 2023 13:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28271C433C8;
 Tue, 28 Nov 2023 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701176452;
 bh=iQY4bJQiN3c6pMqgOKt7BcxpAUaqyamtlGBhvbZfDco=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=F7j6DxAAvfbSz1ShjmsAJbPvKAhHvGylm9giBbGWCDU/Xnbk/BH0+rlZmOfel/UQ7
 zHLA3nw1PmaOckhJnAiw5+q06b4TonZU76jkmts2JEQVCE+cboKi/F8cXnY5sH3Oe1
 znEWErND0IH7bv9nzn1Yg3EzdHPvFLH9KyXx2xEY3mZXZMUeEdZRuzAW3WzvGKdlUQ
 /HsMVUW3BIKIFDWCuiP7UGPN0tIZJlzH045j1VhpK6BZfJBp4D5WxfbSrsvXAgaD6L
 nR46WYDOTy0pVx4oZpVdduR4XsIcxnobfKabOLwTPpdDCp4qQu1B/gh+xAsNmE0bgG
 T4vW7ldjP7rjQ==
From: Maxime Ripard <mripard@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Colin Ian King <colin.i.king@gmail.com>
In-Reply-To: <20231124163917.300685-1-colin.i.king@gmail.com>
References: <20231124163917.300685-1-colin.i.king@gmail.com>
Subject: Re: (subset) [PATCH][next] drm/imagination: Fix a couple of
 spelling mistakes in literal strings
Message-Id: <170117645007.2825698.11061509087464086760.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 14:00:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Nov 2023 16:39:17 +0000, Colin Ian King wrote:
> There are a couple of spelling mistakes in literal strings in the
> stid_fmts array. Fix these.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

