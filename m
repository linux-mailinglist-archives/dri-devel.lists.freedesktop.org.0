Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7FE9909E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 12:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D872C6EAF2;
	Thu, 22 Aug 2019 10:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCE66EAF2;
 Thu, 22 Aug 2019 10:22:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 03:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="181339078"
Received: from gkoczot-mobl.ger.corp.intel.com (HELO [10.252.52.80])
 ([10.252.52.80])
 by orsmga003.jf.intel.com with ESMTP; 22 Aug 2019 03:22:26 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <5f1fdfe3-814e-fad1-663c-7279217fc085@linux.intel.com>
Date: Thu, 22 Aug 2019 12:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
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

ZHJtLW1pc2MtZml4ZXMtMjAxOS0wOC0yMjoKRml4ZXMgZm9yIHY1LjMtcmM2OgotIGRtYSBmaXgg
Zm9yIG9tYXAuCi0gTWFrZSBvdXRwdXQgcG9sbGluZyB3b3JrIG9uIGtvbWVkYS4KLSBGaXggYnBw
IGNvbXB1dGluZyBmb3IgQUZCQyBmb3JtYXRzIGluIGtvbWVkYS4KLSBTdXBwb3J0IHRoZSBtZW1v
cnktcmVnaW9uIHByb3BlcnR5IGluIGtvbWVkYS4KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNl
IGNvbW1pdCBkNDUzMzFiMDBkZGIxNzllMjkxNzY2NjE3MjU5MjYxYzExMmRiODcyOgoKICBMaW51
eCA1LjMtcmM0ICgyMDE5LTA4LTExIDEzOjI2OjQxIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2Ry
bS9kcm0tbWlzYyB0YWdzL2RybS1taXNjLWZpeGVzLTIwMTktMDgtMjIKCmZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0byA2M2RhZjRlMTY2NTQ1MzYzZjNiODc1ZjViODFhZWNiNDZlMWUxZDE5
OgoKICBkcm0vb21hcDogZW5zdXJlIHdlIGhhdmUgYSB2YWxpZCBkbWFfbWFzayAoMjAxOS0wOC0x
MiAxNjoxNjozNCArMDMwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRml4ZXMgZm9yIHY1LjMtcmM2OgotIGRtYSBmaXgg
Zm9yIG9tYXAuCi0gTWFrZSBvdXRwdXQgcG9sbGluZyB3b3JrIG9uIGtvbWVkYS4KLSBGaXggYnBw
IGNvbXB1dGluZyBmb3IgQUZCQyBmb3JtYXRzIGluIGtvbWVkYS4KLSBTdXBwb3J0IHRoZSBtZW1v
cnktcmVnaW9uIHByb3BlcnR5IGluIGtvbWVkYS4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTG93cnkgTGkgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSAoMik6CiAgICAgIGRybS9rb21lZGE6IEluaXRpYWxpemUgYW5kIGVuYWJs
ZSBvdXRwdXQgcG9sbGluZyBvbiBLb21lZGEKICAgICAgZHJtL2tvbWVkYTogQWRkcyBpbnRlcm5h
bCBicHAgY29tcHV0aW5nIGZvciBhcm0gYWZiYyBvbmx5IGZvcm1hdCBZVTA4IFlVMTAKCk1hYXJ0
ZW4gTGFua2hvcnN0ICgxKToKICAgICAgTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAnZHJt
L2RybS1maXhlcycgaW50byBkcm0tbWlzYy1maXhlcwoKTWloYWlsIEF0YW5hc3NvdiAoMSk6CiAg
ICAgIGRybS9rb21lZGE6IEFkZCBzdXBwb3J0IGZvciAnbWVtb3J5LXJlZ2lvbicgRFQgbm9kZSBw
cm9wZXJ0eQoKVG9taSBWYWxrZWluZW4gKDEpOgogICAgICBkcm0vb21hcDogZW5zdXJlIHdlIGhh
dmUgYSB2YWxpZCBkbWFfbWFzawoKIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Rldi5jICAgICAgIHwgIDkgKysrKysrKysrCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmMgICB8IDE5ICsrKysrKysrKysrKysrKysrKysK
IC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaCAgIHwg
IDMgKysrCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVy
LmMgICB8ICA1ICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9rbXMuYyAgICAgICB8ICA1ICsrKysrCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Ry
di5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDQwIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
