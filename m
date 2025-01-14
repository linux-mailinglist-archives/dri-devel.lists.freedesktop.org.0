Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E70CA102B2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 10:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07B710E89B;
	Tue, 14 Jan 2025 09:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jRlcTUAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738CC10E89B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 09:07:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CD8D25C55B9;
 Tue, 14 Jan 2025 09:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9A6C4CEDD;
 Tue, 14 Jan 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736845649;
 bh=GHTt6XJ5ajaqdOSq4bDhfMwkbEW2ZJqSvnM85fO2ZZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jRlcTUAWtxliIbqYa6VO57lfLZLyN3pKAkX87rmoT+xp/p5pbpYFyNR89iNMhoE+a
 wuPO1nufEhbGGNWJpL56UnjqHfh16k7YNHN5Itf+9KE0aZ+lj0nBhcQqdISpPhP4Xs
 X4eA6rR4m8aRY3y1uqrNiM19FoFmVNoThj2QKb0wROlF+pKncAmIhnTQkygG0GVkKJ
 wPaNbY2T0cwHuajj4BnAb14B61yW+bynPqzlkx45ihlPh/m1NLd7dIE5Mu6iar9/h3
 fwY7dg1uOUjxxiNPH/0S6hCjMx9kT/lsa8P0TeBEXthp9CuIdn6ZDODIyWxcWpVlql
 gpOIOdMZwgSQg==
Date: Tue, 14 Jan 2025 11:07:25 +0200
From: Oded Gabbay <ogabbay@kernel.org>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, oded.gabbay@gmail.com,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com
Subject: Re: [PATCH] MAINTAINERS: Update intel_vpu maintainer list
Message-ID: <Z4YpTYzGGDzNFyCU@Oded-ga-LPT.>
References: <20250114084436.1326127-1-jacek.lawrynowicz@linux.intel.com>
 <Z4YnqBXfJAc7Xmsy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4YnqBXfJAc7Xmsy@linux.intel.com>
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

On Tue, Jan 14, 2025 at 10:00:24AM +0100, Stanislaw Gruszka wrote:
> On Tue, Jan 14, 2025 at 09:44:36AM +0100, Jacek Lawrynowicz wrote:
> > Slawek moved to another project and Maciej will be replacing him.
> >
> > Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 33fe500bf3ae6..8f2a266a6c404 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7054,7 +7054,7 @@ F:	include/linux/power/smartreflex.h
> >
> >  DRM ACCEL DRIVERS FOR INTEL VPU
> >  M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > -M:	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > +M:	Maciej Falkowski <maciej.falkowski@linux.intel.com>
> >  L:	dri-devel@lists.freedesktop.org
> >  S:	Supported
> >  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> > --
> > 2.45.1
> >
