Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88F1E95B
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4874A8957B;
	Wed, 15 May 2019 07:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DE089518;
 Wed, 15 May 2019 07:48:21 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2019 00:48:21 -0700
X-ExtLoop1: 1
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.91.148])
 by orsmga001.jf.intel.com with ESMTP; 15 May 2019 00:48:18 -0700
Date: Wed, 15 May 2019 10:48:17 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20190515074817.GA10472@jlahtine-desk.ger.corp.intel.com>
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

SGkgRGF2ZSAmIERhbmllbCwKCkEgZml4IHRvIGNsb3NlIGEgcmFjZSBvcHBvcnR1bml0eSBiZXR3
ZWVuIElSUSBoYW5kbGVyIGFuZCBSQ1UuIAoKVHdvIGZpeGVzIHRoYXQgYXJlIGFsc28gc3RhYmxl
LCBkaXNhYmxpbmcgRkJDIG9uIEdMSyBhbmQgSFNXIEVEUCBmYXN0c2V0CmNvcnJlY3Rpb24uCgpU
aGVzZSBwYXRjaGVzIGRlZmluaXRlbHkgY2F1c2VkIGNvbmZsaWN0cyB3aGVuIG1lcmdlZCwgcmVz
b2x1dGlvbnMgc2hvdWxkCmJlIGFsbCBnb29kLgoKUmVnYXJkcywgSm9vbmFzCgoqKioKCmRybS1p
bnRlbC1uZXh0LWZpeGVzLTIwMTktMDUtMTU6CgotIERpc2FibGUgZnJhbWVidWZmZXIgY29tcHJl
c3Npb24gb24gR2VtaW5pbGFrZQotIEZpeGVzIGZvciBIU1cgRURQIGZhc3RzZXQgYW5kIGEgSVJR
IGhhbmRsZXIgdnMuIFJDVSByYWNlCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0
IDIzMzcyY2NlOGZlN2VlOThhNjQ1OGZkM2QwMzVhNTViODdmMGM2ZmU6CgogIE1lcmdlIHRhZyAn
Z3Z0LW5leHQtZml4ZXMtMjAxOS0wNS0wNycgb2YgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2
dC1saW51eCBpbnRvIGRybS1pbnRlbC1uZXh0LWZpeGVzICgyMDE5LTA1LTA3IDE1OjI5OjE1ICsw
MzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fu
b25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFncy9kcm0taW50ZWwtbmV4dC1m
aXhlcy0yMDE5LTA1LTE1Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYzM2YmViYTZi
Mjk2YjNjMDVhMGYyOTc1M2IwNDc3NWU1YWUyMzg4NjoKCiAgZHJtL2k5MTU6IFNlYWwgcmFjZXMg
YmV0d2VlbiBhc3luYyBHUFUgY2FuY2VsbGF0aW9uLCByZXRpcmVtZW50IGFuZCBzaWduYWxpbmcg
KDIwMTktMDUtMTMgMTM6NTM6MzUgKzAzMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gRGlzYWJsZSBmcmFtZWJ1ZmZl
ciBjb21wcmVzc2lvbiBvbiBHZW1pbmlsYWtlCi0gRml4ZXMgZm9yIEhTVyBFRFAgZmFzdHNldCBh
bmQgYSBJUlEgaGFuZGxlciB2cy4gUkNVIHJhY2UKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQ2hyaXMgV2lsc29uICgxKToK
ICAgICAgZHJtL2k5MTU6IFNlYWwgcmFjZXMgYmV0d2VlbiBhc3luYyBHUFUgY2FuY2VsbGF0aW9u
LCByZXRpcmVtZW50IGFuZCBzaWduYWxpbmcKCkRhbmllbCBEcmFrZSAoMSk6CiAgICAgIGRybS9p
OTE1L2ZiYzogZGlzYWJsZSBmcmFtZWJ1ZmZlciBjb21wcmVzc2lvbiBvbiBHZW1pbmlMYWtlCgpW
aWxsZSBTeXJqw6Rsw6QgKDEpOgogICAgICBkcm0vaTkxNTogRml4IGZhc3RzZXQgdnMuIHBmaXQg
b24vb2ZmIG9uIEhTVyBFRFAgdHJhbnNjb2RlcgoKIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2Uu
YyAgICAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlcXVl
c3QuYyAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfYnJlYWRjcnVt
YnMuYyAgICB8IDc4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9kaXNwbGF5LmMgICAgICAgIHwgIDkgKysrKwogZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfZmJjLmMgICAgICAgICAgICB8ICA0ICsrCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pbnRlbF9ndWNfc3VibWlzc2lvbi5jIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfcGlwZV9jcmMuYyAgICAgICB8IDEzICsrKy0tCiA3IGZpbGVzIGNoYW5nZWQsIDgyIGluc2Vy
dGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
