Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2A16A38F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 11:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612C66E400;
	Mon, 24 Feb 2020 10:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80C96E400;
 Mon, 24 Feb 2020 10:10:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 02:10:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; 
 d="asc'?scan'208";a="231086602"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.14])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2020 02:10:10 -0800
Date: Mon, 24 Feb 2020 17:57:04 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 0/8] drm: Introduce struct drm_device
 based WARN* and use them in i915
Message-ID: <20200224095704.GC13783@zhen-hp.sh.intel.com>
References: <20200220165507.16823-1-pankaj.laxminarayan.bharadiya@intel.com>
 <87eeulthds.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <87eeulthds.fsf@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1558402110=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1558402110==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.02.23 18:09:35 +0200, Jani Nikula wrote:
> On Thu, 20 Feb 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@inte=
l.com> wrote:
> >   drm/i915/gvt: Make WARN* drm specific where drm_priv ptr is available
> >   drm/i915/gvt: Make WARN* drm specific where vgpu ptr is available
>=20
> Thanks for the patches, pushed everything except these, which are for
> Zhenyu & Zhi.
>=20

For GVT changes.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Please also cc intel-gvt-dev list in future for gvt change.

Thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXlOd8AAKCRCxBBozTXgY
Jw5xAJ0RdtZgvCRvjdHQTl0opLgzvy9ZmwCeM1uE7zL9M4/jJ9tcuTSbm7xaPhc=
=JQq2
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--

--===============1558402110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1558402110==--
