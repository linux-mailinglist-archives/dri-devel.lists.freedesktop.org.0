Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B4A1068F2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 10:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FBB6F516;
	Fri, 22 Nov 2019 09:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D434B6F513;
 Fri, 22 Nov 2019 09:40:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 01:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; d="scan'208";a="210381839"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 22 Nov 2019 01:40:44 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iY5Qi-000Ikb-7v; Fri, 22 Nov 2019 17:40:44 +0800
Date: Fri, 22 Nov 2019 17:40:16 +0800
From: kbuild test robot <lkp@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [drm-intel:topic/core-for-CI 20/20] init/Kconfig:76: symbol BROKEN
 is selected by DRM_I915_DEBUG
Message-ID: <201911221706.9Qt79JAl%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dHJlZTogICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0taW50ZWwgdG9waWMvY29y
ZS1mb3ItQ0kKaGVhZDogICAzM2MwMDZlODEzYzM4OTY3NDE5MjdmODZiZjMwYzhiNjQ3YzliMzY2
CmNvbW1pdDogMzNjMDA2ZTgxM2MzODk2NzQxOTI3Zjg2YmYzMGM4YjY0N2M5YjM2NiBbMjAvMjBd
IFJldmVydCAiZHJtL2k5MTU6IERvbid0IHNlbGVjdCBCUk9LRU4iCmNvbmZpZzogcG93ZXJwYy10
YWlzaGFuX2RlZmNvbmZpZwpjb21waWxlcjogcG93ZXJwYy1saW51eC1nY2MgKEdDQykgNy40LjAK
cmVwcm9kdWNlOgogICAgICAgIHdnZXQgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29t
L2ludGVsL2xrcC10ZXN0cy9tYXN0ZXIvc2Jpbi9tYWtlLmNyb3NzIC1PIH4vYmluL21ha2UuY3Jv
c3MKICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNyb3NzCiAgICAgICAgZ2l0IGNoZWNrb3V0
IDMzYzAwNmU4MTNjMzg5Njc0MTkyN2Y4NmJmMzBjOGI2NDdjOWIzNjYKICAgICAgICBHQ0NfVkVS
U0lPTj03LjQuMCBtYWtlLmNyb3NzIEFSQ0g9cG93ZXJwYyAgNDR4L3RhaXNoYW5fZGVmY29uZmln
CiAgICAgICAgR0NDX1ZFUlNJT049Ny40LjAgbWFrZS5jcm9zcyBBUkNIPXBvd2VycGMgCgpJZiB5
b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnClJlcG9ydGVkLWJ5OiBr
YnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KCkFsbCBlcnJvcnMgKG5ldyBvbmVzIHBy
ZWZpeGVkIGJ5ID4+KToKCj4+IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvZW1iZWRkZWQ2eHgvS2Nv
bmZpZzoyOmVycm9yOiByZWN1cnNpdmUgZGVwZW5kZW5jeSBkZXRlY3RlZCEKPj4gYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy9lbWJlZGRlZDZ4eC9LY29uZmlnOjI6IHN5bWJvbCBFTUJFRERFRDZ4eCBk
ZXBlbmRzIG9uIEJST0tFTl9PTl9TTVAKPj4gaW5pdC9LY29uZmlnOjc5OiBzeW1ib2wgQlJPS0VO
X09OX1NNUCBkZXBlbmRzIG9uIEJST0tFTgo+PiBpbml0L0tjb25maWc6NzY6IHN5bWJvbCBCUk9L
RU4gaXMgc2VsZWN0ZWQgYnkgRFJNX0k5MTVfREVCVUcKPj4gZHJpdmVycy9ncHUvZHJtL2k5MTUv
S2NvbmZpZy5kZWJ1ZzoyMDogc3ltYm9sIERSTV9JOTE1X0RFQlVHIGRlcGVuZHMgb24gRFJNX0k5
MTUKPj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZzoyOiBzeW1ib2wgRFJNX0k5MTUgZGVw
ZW5kcyBvbiBEUk0KPj4gZHJpdmVycy9ncHUvZHJtL0tjb25maWc6ODogc3ltYm9sIERSTSBkZXBl
bmRzIG9uIEFHUAo+PiBkcml2ZXJzL2NoYXIvYWdwL0tjb25maWc6Mjogc3ltYm9sIEFHUCBkZXBl
bmRzIG9uIFBDSQo+PiBkcml2ZXJzL3BjaS9LY29uZmlnOjE2OiBzeW1ib2wgUENJIGRlcGVuZHMg
b24gSEFWRV9QQ0kKPj4gZHJpdmVycy9wY2kvS2NvbmZpZzo3OiBzeW1ib2wgSEFWRV9QQ0kgaXMg
c2VsZWN0ZWQgYnkgRk9SQ0VfUENJCj4+IGRyaXZlcnMvcGNpL0tjb25maWc6MTE6IHN5bWJvbCBG
T1JDRV9QQ0kgaXMgc2VsZWN0ZWQgYnkgTVZNRTUxMDAKPj4gYXJjaC9wb3dlcnBjL3BsYXRmb3Jt
cy9lbWJlZGRlZDZ4eC9LY29uZmlnOjUxOiBzeW1ib2wgTVZNRTUxMDAgZGVwZW5kcyBvbiBFTUJF
RERFRDZ4eAogICBGb3IgYSByZXNvbHV0aW9uIHJlZmVyIHRvIERvY3VtZW50YXRpb24va2J1aWxk
L2tjb25maWctbGFuZ3VhZ2UucnN0CiAgIHN1YnNlY3Rpb24gIktjb25maWcgcmVjdXJzaXZlIGRl
cGVuZGVuY3kgbGltaXRhdGlvbnMiCgp2aW0gKzc2IGluaXQvS2NvbmZpZwoKXjFkYTE3N2U0YzNm
NDEgTGludXMgVG9ydmFsZHMgMjAwNS0wNC0xNiAgNzUgIApeMWRhMTc3ZTRjM2Y0MSBMaW51cyBU
b3J2YWxkcyAyMDA1LTA0LTE2IEA3NiAgY29uZmlnIEJST0tFTgpeMWRhMTc3ZTRjM2Y0MSBMaW51
cyBUb3J2YWxkcyAyMDA1LTA0LTE2ICA3NyAgCWJvb2wKXjFkYTE3N2U0YzNmNDEgTGludXMgVG9y
dmFsZHMgMjAwNS0wNC0xNiAgNzggIApeMWRhMTc3ZTRjM2Y0MSBMaW51cyBUb3J2YWxkcyAyMDA1
LTA0LTE2IEA3OSAgY29uZmlnIEJST0tFTl9PTl9TTVAKXjFkYTE3N2U0YzNmNDEgTGludXMgVG9y
dmFsZHMgMjAwNS0wNC0xNiAgODAgIAlib29sCl4xZGExNzdlNGMzZjQxIExpbnVzIFRvcnZhbGRz
IDIwMDUtMDQtMTYgIDgxICAJZGVwZW5kcyBvbiBCUk9LRU4gfHwgIVNNUApeMWRhMTc3ZTRjM2Y0
MSBMaW51cyBUb3J2YWxkcyAyMDA1LTA0LTE2ICA4MiAgCWRlZmF1bHQgeQpeMWRhMTc3ZTRjM2Y0
MSBMaW51cyBUb3J2YWxkcyAyMDA1LTA0LTE2ICA4MyAgCgo6Ojo6OjogVGhlIGNvZGUgYXQgbGlu
ZSA3NiB3YXMgZmlyc3QgaW50cm9kdWNlZCBieSBjb21taXQKOjo6Ojo6IDFkYTE3N2U0YzNmNDE1
MjRlODg2YjdmMWI4YTBjMWZjNzMyMWNhYzIgTGludXgtMi42LjEyLXJjMgoKOjo6Ojo6IFRPOiBM
aW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAcHBjOTcwLm9zZGwub3JnPgo6Ojo6OjogQ0M6IExpbnVz
IFRvcnZhbGRzIDx0b3J2YWxkc0BwcGM5NzAub3NkbC5vcmc+CgotLS0KMC1EQVkga2VybmVsIHRl
c3QgaW5mcmFzdHJ1Y3R1cmUgICAgICAgICAgICAgICAgIE9wZW4gU291cmNlIFRlY2hub2xvZ3kg
Q2VudGVyCmh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9rYnVpbGQtYWxsQGxp
c3RzLjAxLm9yZyBJbnRlbCBDb3Jwb3JhdGlvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
