Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ADFB07C3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0F16EC3E;
	Thu, 12 Sep 2019 04:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5CB6E0E2;
 Wed, 11 Sep 2019 23:32:38 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 16:32:38 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="187330708"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga003-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Sep 2019 16:32:37 -0700
Date: Wed, 11 Sep 2019 16:33:09 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20190911233309.GA18449@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSBhbmQgRGFuaWVsLAoKSGVyZSBnb2VzIGRybS1pbnRlbC1uZXh0LWZpeGVzLTIwMTkt
MDktMTE6CgpGZXcgZml4ZXMgb24gR0dUVCBhbmQgUFBHVFQgYXJvdW5kIHBpbiwgbG9ja3MsIGZl
bmNlIGFuZCB2Z3B1LgoKVGhpcyBhbHNvIGluY2x1ZGVzIEdWVCBmaXhlcyB3aXRoIHR3byByZWNl
bnQgZml4ZXM6Cm9uZSBmb3IgcmVjZW50IGd1ZXN0IGhhbmcgcmVncmVzc2lvbiBhbmQgYW5vdGhl
ciBmb3IgZ3Vlc3QgcmVzZXQgZml4LgoKVGhhbmtzLApSb2RyaWdvLgoKVGhlIGZvbGxvd2luZyBj
aGFuZ2VzIHNpbmNlIGNvbW1pdCA1NzhkMjM0MmVjNzAyZTVmYjhhNzc5ODNmYWJiMzc1NGFlM2U5
NjYwOgoKICBNZXJnZSB0YWcgJ2RybS1uZXh0LTUuNC0yMDE5LTA4LTIzJyBvZiBnaXQ6Ly9wZW9w
bGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eCBpbnRvIGRybS1uZXh0ICgyMDE5LTA4LTI3
IDE3OjIyOjE1ICsxMDAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFncy9kcm0t
aW50ZWwtbmV4dC1maXhlcy0yMDE5LTA5LTExCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gNmU1YzUyNzJjYTAwODA5YWFlMjA4MTdlZmI2ZjI1ODgxMjY4YjUwYjoKCiAgZHJtL2k5MTU6
IFVzZSBOT0VWSUNUIGZvciBmaXJzdCBwYXNzIG9uIGF0dGVtcGluZyB0byBwaW4gYSBHR1RUIG1t
YXAgKDIwMTktMDktMDYgMDk6NTM6MTUgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkZldyBmaXhlcyBvbiBHR1RU
IGFuZCBQUEdUVCBhcm91bmQgcGluLCBsb2NrcywgZmVuY2UgYW5kIHZncHUuCgpUaGlzIGFsc28g
aW5jbHVkZXMgR1ZUIGZpeGVzIHdpdGggdHdvIHJlY2VudCBmaXhlczoKb25lIGZvciByZWNlbnQg
Z3Vlc3QgaGFuZyByZWdyZXNzaW9uIGFuZCBhbm90aGVyIGZvciBndWVzdCByZXNldCBmaXguCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkNocmlzIFdpbHNvbiAoMyk6CiAgICAgIGRybS9pOTE1OiBIb2xkIGlycS1vZmYgZm9y
IHRoZSBlbnRpcmUgZmFrZSBsb2NrIHBlcmlvZAogICAgICBkcm0vaTkxNTogRmx1c2ggdGhlIGV4
aXN0aW5nIGZlbmNlIGJlZm9yZSBHR1RUIHJlYWQvd3JpdGUKICAgICAgZHJtL2k5MTU6IFVzZSBO
T0VWSUNUIGZvciBmaXJzdCBwYXNzIG9uIGF0dGVtcGluZyB0byBwaW4gYSBHR1RUIG1tYXAKClJv
ZHJpZ28gVml2aSAoMSk6CiAgICAgIE1lcmdlIHRhZyAnZ3Z0LW5leHQtZml4ZXMtMjAxOS0wOS0w
Nicgb2YgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eCBpbnRvIGRybS1pbnRlbC1u
ZXh0LWZpeGVzCgpXZWluYW4gTGkgKDEpOgogICAgICBkcm0vaTkxNS9ndnQ6IHVwZGF0ZSBSSU5H
X1NUQVJUIHJlZyBvZiB2R1BVIHdoZW4gdGhlIGNvbnRleHQgaXMgc3VibWl0dGVkIHRvIGk5MTUK
ClhpYW9saW4gWmhhbmcgKDIpOgogICAgICBkcm0vaTkxNS9ndnQ6IHVwZGF0ZSB2Z3B1IHdvcmts
b2FkIGhlYWQgcG9pbnRlciBjb3JyZWN0bHkKICAgICAgZHJtL2k5MTU6IHRvIG1ha2UgdmdwdSBw
cGd0dCBub3RpZmljYWl0b24gYXMgYXRvbWljIG9wZXJhdGlvbgoKIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L2ludGVsX2VuZ2luZV9wbS5jIHwgMjggKysrKysrKysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfcmVzZXQuYyAgICAgfCAgOSArKysrLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF90aW1lbGluZS5jICB8IDEwICsrKystLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9zY2hlZHVsZXIuYyAgICAgIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCAgICAgICAgICAgfCAgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jICAgICAgICAgICB8IDIzICsrKysrKysr
KysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jICAgICAgIHwgMTIg
KysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlcXVlc3QuYyAgICAgICB8ICA5
ICsrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5jICAgICAgICAgIHwgIDEg
KwogMTAgZmlsZXMgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKSwgNDggZGVsZXRpb25zKC0pCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
