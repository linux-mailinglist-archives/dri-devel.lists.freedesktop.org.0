Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774C818A6D
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 15:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E0B89C63;
	Thu,  9 May 2019 13:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B601189C55;
 Thu,  9 May 2019 13:17:34 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 06:17:34 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 09 May 2019 06:17:32 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hOivU-0008BF-Fn; Thu, 09 May 2019 21:17:32 +0800
Date: Thu, 9 May 2019 21:16:42 +0800
From: kbuild test robot <lkp@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: [drm-intel:drm-intel-next-queued 4/6]
 drivers/gpu/drm/drm_hdcp.c:27:3: sparse: sparse: symbol 'srm_data' was not
 declared. Should it be static?
Message-ID: <201905092112.GI4n4yfx%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 kbuild-all@01.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dHJlZTogICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0taW50ZWwgZHJtLWludGVs
LW5leHQtcXVldWVkCmhlYWQ6ICAgYzE2ZmQ5YmU3MGZhZjNjNDlhNjE3MDBlZmQxNjAxOGRkOTEw
ZTM5MApjb21taXQ6IDY0OThiZjU4MDBhMzAyZWY2OWU3ZjQ5MTRlNzI3ODkzZjI3OGJiMmYgWzQv
Nl0gZHJtOiByZXZvY2F0aW9uIGNoZWNrIGF0IGRybSBzdWJzeXN0ZW0KcmVwcm9kdWNlOgogICAg
ICAgICMgYXB0LWdldCBpbnN0YWxsIHNwYXJzZQogICAgICAgIGdpdCBjaGVja291dCA2NDk4YmY1
ODAwYTMwMmVmNjllN2Y0OTE0ZTcyNzg5M2YyNzhiYjJmCiAgICAgICAgbWFrZSBBUkNIPXg4Nl82
NCBhbGxtb2Rjb25maWcKICAgICAgICBtYWtlIEM9MSBDRj0nLWZkaWFnbm9zdGljLXByZWZpeCAt
RF9fQ0hFQ0tfRU5ESUFOX18nCgpJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xs
b3dpbmcgdGFnClJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4K
CgpzcGFyc2Ugd2FybmluZ3M6IChuZXcgb25lcyBwcmVmaXhlZCBieSA+PikKCj4+IGRyaXZlcnMv
Z3B1L2RybS9kcm1faGRjcC5jOjI3OjM6IHNwYXJzZTogc3BhcnNlOiBzeW1ib2wgJ3NybV9kYXRh
JyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+PiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2hkY3AuYzoyMzU6Njogc3BhcnNlOiBzcGFyc2U6IHN5bWJvbCAnZHJtX2hkY3BfcmVx
dWVzdF9zcm0nIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpQbGVhc2Ug
cmV2aWV3IGFuZCBwb3NzaWJseSBmb2xkIHRoZSBmb2xsb3d1cCBwYXRjaC4KCi0tLQowLURBWSBr
ZXJuZWwgdGVzdCBpbmZyYXN0cnVjdHVyZSAgICAgICAgICAgICAgICBPcGVuIFNvdXJjZSBUZWNo
bm9sb2d5IENlbnRlcgpodHRwczovL2xpc3RzLjAxLm9yZy9waXBlcm1haWwva2J1aWxkLWFsbCAg
ICAgICAgICAgICAgICAgICBJbnRlbCBDb3Jwb3JhdGlvbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
