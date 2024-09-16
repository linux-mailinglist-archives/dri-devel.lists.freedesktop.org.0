Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B032979E75
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B315110E322;
	Mon, 16 Sep 2024 09:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RHTFTBB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ED510E32A;
 Mon, 16 Sep 2024 09:28:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 343705C05FE;
 Mon, 16 Sep 2024 09:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906D3C4CEC4;
 Mon, 16 Sep 2024 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726478894;
 bh=cgZc/BgRQ3td5Yw9a3GeSiVF4W9kLwymE9bQrLcXTyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RHTFTBB1RHQJECTBzjgnzq2ap9XivxUqLWC4wACIymL4WcOZKTDaxHezZYV5RLOs+
 DBNEfT5PLDn2XPt4fVogxMNjh39foO/BvZtKATlRkFzRPW3OVBe5atD9zI5ZtZGDHs
 Vg/BWQRV3GdtzISpskZb6KEsU6KzLjZ9HpjqKt/rp4UcDftWcqxWGKpM9HqqmXzyl7
 HIjusTfLhY2ifMvDwemxW18I1/5ONSS0yp5XVGlhdtV58Q6dj40VqA/f6OxPiKm+85
 zNuSdA8VP+1KRwFts+nKlHnE2XtfeJHI9pcm82CkNoZP3kmL8HZbBg5ZFCcJVTIb3A
 WoqlXYlvbX3Bw==
Date: Mon, 16 Sep 2024 11:28:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: zhenyuw@linux.intel.com, zhi.wang.linux@gmail.com, 
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, 
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] drm/i915/gvt: Correct multiple typos in comments
Message-ID: <hph6vzdz54megzoqwiqnozddog5oqzwn5oz3j4hcrevjav5q3n@r4cz7eq3buic>
References: <20240913021612.41948-1-shenlichuan@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913021612.41948-1-shenlichuan@vivo.com>
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

Hi Shen,

On Fri, Sep 13, 2024 at 10:16:12AM GMT, Shen Lichuan wrote:
> Fixed some spelling errors, the details are as follows:
> 
> -in the code comments:
> 	addess->address
> 	trasitions->transitions
> 	furture->future
> 	unsubmited->unsubmitted
> 
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

reviewed and merged to drm-intel-next.

Thanks,
Andi
