Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC896F90A2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 14:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0347D6E093;
	Tue, 12 Nov 2019 13:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0386E093
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 13:28:21 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 05:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,296,1569308400"; d="scan'208";a="378877140"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 12 Nov 2019 05:28:20 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iUWDT-0001eT-Md; Tue, 12 Nov 2019 21:28:19 +0800
Date: Tue, 12 Nov 2019 21:27:21 +0800
From: kbuild test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Subject: [radeon-alex:amd-mainline-dkms-5.2 2713/2834]
 include/drm/drm_print.h:219:34: sparse:  the previous one is here
Message-ID: <201911122120.u1XZcews%lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dHJlZTogICBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eC5naXQgYW1k
LW1haW5saW5lLWRrbXMtNS4yCmhlYWQ6ICAgYTQ4YjBjYzFjZGYzOTAwZTNlNzM4MDFmOWRlNjRh
ZmJiNzBkYzE5Mwpjb21taXQ6IGM3YzgxYjI0Mzk0YTM4ZDE0NjA3YTE1NjE0ZWJlYTVkYTMzNWVi
ZDcgWzI3MTMvMjgzNF0gZHJtL2FtZGtjbDogZHJvcCBrY2xfZHJtX2dldF9mb3JtYXRfbmFtZQpy
ZXByb2R1Y2U6CiAgICAgICAgIyBhcHQtZ2V0IGluc3RhbGwgc3BhcnNlCiAgICAgICAgIyBzcGFy
c2UgdmVyc2lvbjogdjAuNi4xLTI5LWc3ODFiYzVkLWRpcnR5CiAgICAgICAgZ2l0IGNoZWNrb3V0
IGM3YzgxYjI0Mzk0YTM4ZDE0NjA3YTE1NjE0ZWJlYTVkYTMzNWViZDcKICAgICAgICBtYWtlIEFS
Q0g9eDg2XzY0IGFsbG1vZGNvbmZpZwogICAgICAgIG1ha2UgQz0xIENGPSctZmRpYWdub3N0aWMt
cHJlZml4IC1EX19DSEVDS19FTkRJQU5fXycKCklmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkg
YWRkIGZvbGxvd2luZyB0YWcKUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPgoKCnNwYXJzZSB3YXJuaW5nczogKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KQoKICAg
aW5jbHVkZS9rY2wva2NsX2RybS5oOjE1MToxOiBzcGFyc2U6IHNwYXJzZTogbXVsdGlwbGUgZGVm
aW5pdGlvbnMgZm9yIGZ1bmN0aW9uICdkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19w
Y2lfZnJhbWVidWZmZXJzJwogICBpbmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmg6NjEyOjE6IHNw
YXJzZTogIHRoZSBwcmV2aW91cyBvbmUgaXMgaGVyZQogICBpbmNsdWRlL2tjbC9rY2xfZHJtLmg6
NDA1OjM0OiBzcGFyc2U6IHNwYXJzZTogbXVsdGlwbGUgZGVmaW5pdGlvbnMgZm9yIGZ1bmN0aW9u
ICdkcm1fZGVidWdfcHJpbnRlcicKPj4gaW5jbHVkZS9kcm0vZHJtX3ByaW50Lmg6MjE5OjM0OiBz
cGFyc2U6ICB0aGUgcHJldmlvdXMgb25lIGlzIGhlcmUKICAgaW5jbHVkZS9rY2wva2NsX2RybV9i
YWNrcG9ydC5oOjExODoyODogc3BhcnNlOiBzcGFyc2U6IHJlZGVmaW5pdGlvbiBvZiBzdHJ1Y3Qg
ZHJtX2Zvcm1hdF9uYW1lX2J1ZgoKdmltICsyMTkgaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKCmQ4
MTg3MTc3YjBiMTk1IFJvYiBDbGFyayAgICAgICAyMDE2LTExLTA1ICAyMTEgIAozZDM4N2Q5MjNj
MThhZiBEYW5pZWwgVmV0dGVyICAgMjAxNi0xMi0yOCAgMjEyICAvKioKM2QzODdkOTIzYzE4YWYg
RGFuaWVsIFZldHRlciAgIDIwMTYtMTItMjggIDIxMyAgICogZHJtX2RlYnVnX3ByaW50ZXIgLSBj
b25zdHJ1Y3QgYSAmZHJtX3ByaW50ZXIgdGhhdCBvdXRwdXRzIHRvIHByX2RlYnVnKCkKM2QzODdk
OTIzYzE4YWYgRGFuaWVsIFZldHRlciAgIDIwMTYtMTItMjggIDIxNCAgICogQHByZWZpeDogZGVi
dWcgb3V0cHV0IHByZWZpeAozZDM4N2Q5MjNjMThhZiBEYW5pZWwgVmV0dGVyICAgMjAxNi0xMi0y
OCAgMjE1ICAgKgozZDM4N2Q5MjNjMThhZiBEYW5pZWwgVmV0dGVyICAgMjAxNi0xMi0yOCAgMjE2
ICAgKiBSRVRVUk5TOgozZDM4N2Q5MjNjMThhZiBEYW5pZWwgVmV0dGVyICAgMjAxNi0xMi0yOCAg
MjE3ICAgKiBUaGUgJmRybV9wcmludGVyIG9iamVjdAozZDM4N2Q5MjNjMThhZiBEYW5pZWwgVmV0
dGVyICAgMjAxNi0xMi0yOCAgMjE4ICAgKi8KM2QzODdkOTIzYzE4YWYgRGFuaWVsIFZldHRlciAg
IDIwMTYtMTItMjggQDIxOSAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX3ByaW50ZXIgZHJtX2Rl
YnVnX3ByaW50ZXIoY29uc3QgY2hhciAqcHJlZml4KQozZDM4N2Q5MjNjMThhZiBEYW5pZWwgVmV0
dGVyICAgMjAxNi0xMi0yOCAgMjIwICB7CjNkMzg3ZDkyM2MxOGFmIERhbmllbCBWZXR0ZXIgICAy
MDE2LTEyLTI4ICAyMjEgIAlzdHJ1Y3QgZHJtX3ByaW50ZXIgcCA9IHsKM2QzODdkOTIzYzE4YWYg
RGFuaWVsIFZldHRlciAgIDIwMTYtMTItMjggIDIyMiAgCQkucHJpbnRmbiA9IF9fZHJtX3ByaW50
Zm5fZGVidWcsCjNkMzg3ZDkyM2MxOGFmIERhbmllbCBWZXR0ZXIgICAyMDE2LTEyLTI4ICAyMjMg
IAkJLnByZWZpeCA9IHByZWZpeAozZDM4N2Q5MjNjMThhZiBEYW5pZWwgVmV0dGVyICAgMjAxNi0x
Mi0yOCAgMjI0ICAJfTsKM2QzODdkOTIzYzE4YWYgRGFuaWVsIFZldHRlciAgIDIwMTYtMTItMjgg
IDIyNSAgCXJldHVybiBwOwozZDM4N2Q5MjNjMThhZiBEYW5pZWwgVmV0dGVyICAgMjAxNi0xMi0y
OCAgMjI2ICB9CjAyYzk2NTZiMmYwZDY5IEhhbmVlbiBNb2hhbW1lZCAyMDE3LTEwLTE3ICAyMjcg
IAoKOjo6Ojo6IFRoZSBjb2RlIGF0IGxpbmUgMjE5IHdhcyBmaXJzdCBpbnRyb2R1Y2VkIGJ5IGNv
bW1pdAo6Ojo6OjogM2QzODdkOTIzYzE4YWZiYWNlZjhmMTRjY2FhMmFjZTJhMjk3ZGY3NCBkcm0v
cHJpbnRlcjogYWRkIGRlYnVnIHByaW50ZXIKCjo6Ojo6OiBUTzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KOjo6Ojo6IENDOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgoKLS0tCjAtREFZIGtlcm5lbCB0ZXN0IGluZnJhc3RydWN0dXJlICAgICAg
ICAgICAgICAgICBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlcgpodHRwczovL2xpc3RzLjAx
Lm9yZy9oeXBlcmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBsaXN0cy4wMS5vcmcgSW50ZWwgQ29ycG9y
YXRpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
