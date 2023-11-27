Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1E7F9C66
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 10:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C5E10E1FD;
	Mon, 27 Nov 2023 09:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFB910E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 09:10:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C436C61119;
 Mon, 27 Nov 2023 09:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2178FC433C9;
 Mon, 27 Nov 2023 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701076239;
 bh=Ps+Fa/dulVUd1PDAHALRfrfI3qw3k68n8ZSw/yf2lAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y2iXI9YoFZ19dm4dhfILyvtYzs8ky9ggc84g/7AIdC9fNR4yv1YB5h7FDVPlgyvy8
 zgKol8BCqqiLfVBkJEJCAQcOVCgSdusaqMHjXbJ9t7an5MPLbWcRpM1ZrJxScYtA55
 k+o9CdZOuSQMrNLT5ksGcomOa9h2S3WvfVOdSlBO1A3T5WrCwj7NBKXNT4VqMU1Pej
 pYbV7C51SNvO5k6Nn3KF0oDGPAd8fPjXSG606L7Y+8k4QFTseEQboFCMThgdTINi09
 hjwS8+c6R0UOCuuKv0O1XGunT+m/iIB7I1Lbmm6CFB3oSB50WTQTMdJBdJo0vzxyr8
 /+qCaV560su+Q==
Date: Mon, 27 Nov 2023 10:10:36 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1 0/3] Rockchip inno_hdmi update
Message-ID: <ehbpa5qzq5aednqerhlb4xi652dd6rxslsjrurkkt5eruxssvv@2dcl2765fjix>
References: <2601b669-c570-f39d-8cf9-bff56c939912@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w7qeozagnw3krs5v"
Content-Disposition: inline
In-Reply-To: <2601b669-c570-f39d-8cf9-bff56c939912@gmail.com>
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--w7qeozagnw3krs5v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johan,

On Sun, Nov 26, 2023 at 11:55:03AM +0100, Johan Jonker wrote:
> Combined update for the Rockchip inno_hdmi driver in a
> somewhat similar way to what is proposed for the
> "Create HDMI Connector infrastructure patch serie".
> Keeping the inno_hdmi and rk3066_hdmi driver functions
> comparable makes maintanance easier.

It's not clear to me what your intent is exactly, these are my exact
patches that you just sent again?

Maxime

--w7qeozagnw3krs5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWRdDAAKCRDj7w1vZxhR
xVKcAQClmlIR0bc7c19KWzUwSe/UDRDPcWIBHtu8Uoaf+2t79gD+IDyn3OKNIt6D
P7XtYjRgJXnPgNggszjP7+iEpGgicwI=
=sHaM
-----END PGP SIGNATURE-----

--w7qeozagnw3krs5v--
