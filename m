Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACFEB4ACB8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D8710E245;
	Tue,  9 Sep 2025 11:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t8MWh4yz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DFC10E245
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:49:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C217434E4;
 Tue,  9 Sep 2025 11:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE54DC4CEF5;
 Tue,  9 Sep 2025 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757418546;
 bh=/Bulxo4F3wCizTPEQOs4uKuEQ+fIeH66uTuCla07lxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t8MWh4yzDYbiHhLsWiVWE3pkzkgsQvtUSx306qDGPqgYTilB+mU3esFu6EPj1/Laa
 vRDAInb4IAWJFI+lISBi2YMtObuixquwVMWwPcgFaZW1O5Gy6mT5dlWexK8Horricf
 /OP3YKRGlobgccY5NOqyp7kHv5zauqv6cMmQ5Ghh4JLAsmdXNN8NqGrMf1Dq2V2lCr
 +3Pi4jlam6/84fSbui4JQnPs+MIUJ/DrAFdtxzvdoJXXYylG/nnxZpGe9srbBvuWyt
 wrl4FSoPX9urtX6h73VHxEtMSz7CaCpYkK4JXB3J4POOAs1NaOZoL8luAIrVMLaaK1
 e3ow55aNOlsBA==
Date: Tue, 9 Sep 2025 13:49:03 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 acourbot@nvidia.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: drm-misc: fix X: entries for nova/nouveau
Message-ID: <20250909-resolute-maroon-hippo-0cffec@houat>
References: <20250902190247.435340-1-dakr@kernel.org>
 <20250909-fragrant-chameleon-of-democracy-5be519@houat>
 <631405c2-f709-4472-9cdb-a51e421e6f68@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7g7cbqjhn7tjaxhk"
Content-Disposition: inline
In-Reply-To: <631405c2-f709-4472-9cdb-a51e421e6f68@kernel.org>
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


--7g7cbqjhn7tjaxhk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] MAINTAINERS: drm-misc: fix X: entries for nova/nouveau
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 01:45:25PM +0200, Danilo Krummrich wrote:
> On 9/9/25 1:43 PM, Maxime Ripard wrote:
> > We should probably amend the nouveau entry to point to the drm-misc repo
> > if it's the de-facto tree these days?
> This already happened with a preceding patch before this one has been sent. :)

Ah, perfect then :)

Maxime

--7g7cbqjhn7tjaxhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMAULwAKCRAnX84Zoj2+
dvYVAXsHgoBAeDk+CksOkqz72s9fDDnQ4ylEWAzj+oEyCH/lCDRhuvlEF+EZmyAH
PDB+IxQBfiU0qJUTbetRKq9/flhKX4sKKUMTBBplILCFes19NCmYGzAvHYg2kMS2
yK/9e4EAnA==
=FSaM
-----END PGP SIGNATURE-----

--7g7cbqjhn7tjaxhk--
