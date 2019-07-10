Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AF364716
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 15:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2991289E03;
	Wed, 10 Jul 2019 13:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9141489E03;
 Wed, 10 Jul 2019 13:38:18 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 06:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="159766035"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.81.238])
 by orsmga008.jf.intel.com with ESMTP; 10 Jul 2019 06:38:14 -0700
Date: Wed, 10 Jul 2019 16:38:13 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20190710133813.GA2456@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSAmIERhbmllbCwKClNvbWUgcmF0aGVyIGltcG9ydGFudCBmaXhlcyB0aGF0IGFwcGVh
cmVkIGFmdGVyIC1yYzYgYW5kCm1pc3NlZCB2NS4yLiBBcyBhIFBSIGJ5IHJlcXVlc3Qgb2YgRGFu
aWVsLgoKVGhlc2UgYXZvaWQgb25lIFdBUk4gYW5kIHBvdGVudGlhbCBkaXJ0eSBwb2ludGVyIGRl
cmVmLApmaXggYSByZWdyZXNzaW9uIG9uIHNhdHVyYXRlZCBtZWRpYSBsb2FkcyBhbmQgYWRkIG1p
c3NpbmcKSWNlbGFrZSBXL0FzLgoKSSd2ZSBtYW51YWxseSBhZGRlZCBDYzogc3RhYmxlIHRvIGFs
bCBvZiB0aGVtLiBUaGVyZSdzIGFsc28gb25lCnBhdGNoIHRoYXQgaXMgZGVwZW5kZW5jeSB0byB0
aGUgSWNlbGFrZSBXL0EgY29kZS4KClJlZ2FyZHMsIEpvb25hcwoKKioqCgpkcm0taW50ZWwtZml4
ZXMtMjAxOS0wNy0xMDoKCi0gVXNlcnB0ci9leHQ0IGludGVycGxheSBXQVJOIGZpeCAoaHR0cHM6
Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDMzMTcpCi0gRml4IGEgcmVn
cmVzc2lvbiBvbiBzYXR1cmF0ZWQgbWVkaWEgdHJhbnNjb2Rpbmcgc3lzdGVtCi0gSW52YWxpZCBw
b2ludGVyIGRlcmVmIGZpeCBpbiBlcnJvciBjYXB0dXJlICh0cmlnZ2VyZWQgYnkgaGFuZykKLSBN
aXNzaW5nIEljZWxha2UgVy9BcwoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAw
ZWNmZWJkMmI1MjQwNGFlMGM1NGE4NzhjODcyYmI5MzM2M2FkYTM2OgoKICBMaW51eCA1LjIgKDIw
MTktMDctMDcgMTU6NDE6NTYgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCB0
YWdzL2RybS1pbnRlbC1maXhlcy0yMDE5LTA3LTEwCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gZDdlOGExOWIzOGM4YWMxYTMyYjZiMDNhZjA0OWUyYzg4ZDQxNTVkYjoKCiAgZHJtL2k5
MTU6IERvbid0IGRlcmVmZXJlbmNlIHJlcXVlc3QgaWYgaXQgbWF5IGhhdmUgYmVlbiByZXRpcmVk
IHdoZW4gcHJpbnRpbmcgKDIwMTktMDctMDkgMTY6MTY6MTggKzAzMDApCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gVXNl
cnB0ci9leHQ0IGludGVycGxheSBXQVJOIGZpeCAoaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yMDMzMTcpCi0gRml4IGEgcmVncmVzc2lvbiBvbiBzYXR1cmF0ZWQg
bWVkaWEgdHJhbnNjb2Rpbmcgc3lzdGVtCi0gSW52YWxpZCBwb2ludGVyIGRlcmVmIGZpeCBpbiBl
cnJvciBjYXB0dXJlICh0cmlnZ2VyZWQgYnkgaGFuZykKLSBNaXNzaW5nIEljZWxha2UgVy9BcwoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpDaHJpcyBXaWxzb24gKDMpOgogICAgICBkcm0vaTkxNTogTWFrZSB0aGUgc2VtYXBo
b3JlIHNhdHVyYXRpb24gbWFzayBnbG9iYWwKICAgICAgZHJtL2k5MTUvdXNlcnB0cjogQWNxdWly
ZSB0aGUgcGFnZSBsb2NrIGFyb3VuZCBzZXRfcGFnZV9kaXJ0eSgpCiAgICAgIGRybS9pOTE1OiBE
b24ndCBkZXJlZmVyZW5jZSByZXF1ZXN0IGlmIGl0IG1heSBoYXZlIGJlZW4gcmV0aXJlZCB3aGVu
IHByaW50aW5nCgpKb2huIEhhcnJpc29uICgxKToKICAgICAgZHJtL2k5MTU6IFN1cHBvcnQgZmxh
Z3MgaW4gd2hpdGxpc3QgV0FzCgpLZW5uZXRoIEdyYXVua2UgKDEpOgogICAgICBkcm0vaTkxNTog
RGlzYWJsZSBTQU1QTEVSX1NUQVRFIHByZWZldGNoaW5nIG9uIGFsbCBHZW4xMSBzdGVwcGluZ3Mu
CgpMaW9uZWwgTGFuZHdlcmxpbiAoMyk6CiAgICAgIGRybS9pOTE1L3BlcmY6IGZpeCBJQ0wgcGVy
ZiByZWdpc3RlciBvZmZzZXRzCiAgICAgIGRybS9pOTE1OiB3aGl0ZWxpc3QgUFNfKERFUFRIfElO
Vk9DQVRJT04pX0NPVU5UCiAgICAgIGRybS9pOTE1L2ljbDogd2hpdGVsaXN0IFBTXyhERVBUSHxJ
TlZPQ0FUSU9OKV9DT1VOVAoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX3VzZXJwdHIu
YyAgICB8IDEwICsrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGVyZi5jICAgICAg
ICAgICB8IDEwICsrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAg
ICAgICB8ICA3ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlcXVlc3QuYyAgICAg
ICAgfCAgNCArLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2NvbnRleHQuYyAgICAgICB8
ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2NvbnRleHRfdHlwZXMuaCB8ICAyIC0t
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9lbmdpbmVfY3MuYyAgICAgfCAxNyArKysrKysr
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2VuZ2luZV90eXBlcy5oICB8ICAyICsr
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF93b3JrYXJvdW5kcy5jICAgfCA0MyArKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0KIDkgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygr
KSwgMTkgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
