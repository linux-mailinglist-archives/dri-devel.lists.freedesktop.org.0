Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B964023C9B2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 12:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C246E102;
	Wed,  5 Aug 2020 10:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3AA6E0AB;
 Wed,  5 Aug 2020 10:00:08 +0000 (UTC)
IronPort-SDR: FBviox/PnrYc6EkWD2Xar51Dw1aZIyTvEjnVPTrZtfrZOXKNeaTkvsPZNg3XSJNyc+hiCMgC2Y
 q21BG8IeKFvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="153653062"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="153653062"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 03:00:06 -0700
IronPort-SDR: jaAouMMLezKO/6tJ9IdXvKg3lnK3fNxBM8TmXtl14bKBt0A/abHEhx7rD5sTMAE46Vu4/sP70A
 rW8dcNf4+YzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="492769092"
Received: from monicael-mobl.ti.intel.com (HELO [10.252.39.220])
 ([10.252.39.220])
 by fmsmga006.fm.intel.com with ESMTP; 05 Aug 2020 03:00:03 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <b2043dad-f118-bd19-54a6-f23bf6264007@linux.intel.com>
Date: Wed, 5 Aug 2020 12:00:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtLW1pc2MtbmV4dC1maXhlcy0yMDIwLTA4LTA1Ogpkcm0tbWlzYy1uZXh0LWZpeGVzIGZvciB2
NS45LXJjMToKLSBGaXggZHJtX2RwX21zdF9wb3J0IHJlZmNvdW50IGxlYWtzIGluIGRybV9kcF9t
c3RfYWxsb2NhdGVfdmNwaQotIEZpeCBhIGZiY29uIE9PQiByZWFkIGluIGZiZGV2LCBmb3VuZCBi
eSBzeXpib3QuCi0gTWFyayB2Z2FfdHJ5Z2V0IHN0YXRpYyBhcyBpdCdzIG5vdCB1c2VkIGVsc2V3
aGVyZS4KLSBTbWFsbCBmaXhlcyB0byB4bG54LgotIFJlbW92ZSBudWxsIGNoZWNrIGZvciBrZnJl
ZSBpbiBkcm1fZGV2X3JlbGVhc2UuCi0gRml4IERSTV9GT1JNQVRfTU9EX0FNTE9HSUNfRkJDIGRl
ZmluaXRpb24uCi0gRml4IG1vZGUgaW5pdGlhbGl6YXRpb24gaW4gb21hcF9jb25uZWN0b3JfbW9k
ZV92YWxpZCgpLgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDIwNjczOTExOTUw
OGQ1YWI0YjQyYWI0ODBmZjYxYTdlNmNkNzJkN2M6CgogIE1lcmdlIHRhZyAnYW1kLWRybS1uZXh0
LTUuOS0yMDIwLTA3LTE3JyBvZiBnaXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9s
aW51eCBpbnRvIGRybS1uZXh0ICgyMDIwLTA3LTIzIDE1OjM4OjExICsxMDAwKQoKYXJlIGF2YWls
YWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0
b3Aub3JnL2RybS9kcm0tbWlzYyB0YWdzL2RybS1taXNjLW5leHQtZml4ZXMtMjAyMC0wOC0wNQoK
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGEzNGEwYTYzMmRkOTkxYTM3MWZlYzU2NDMx
ZDczMjc5ZjljNTQwMjk6CgogIGRybTogZml4IGRybV9kcF9tc3RfcG9ydCByZWZjb3VudCBsZWFr
cyBpbiBkcm1fZHBfbXN0X2FsbG9jYXRlX3ZjcGkgKDIwMjAtMDgtMDQgMTI6MjE6MTEgLTA0MDAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCmRybS1taXNjLW5leHQtZml4ZXMgZm9yIHY1LjktcmMxOgotIEZpeCBkcm1fZHBf
bXN0X3BvcnQgcmVmY291bnQgbGVha3MgaW4gZHJtX2RwX21zdF9hbGxvY2F0ZV92Y3BpCi0gRml4
IGEgZmJjb24gT09CIHJlYWQgaW4gZmJkZXYsIGZvdW5kIGJ5IHN5emJvdC4KLSBNYXJrIHZnYV90
cnlnZXQgc3RhdGljIGFzIGl0J3Mgbm90IHVzZWQgZWxzZXdoZXJlLgotIFNtYWxsIGZpeGVzIHRv
IHhsbnguCi0gUmVtb3ZlIG51bGwgY2hlY2sgZm9yIGtmcmVlIGluIGRybV9kZXZfcmVsZWFzZS4K
LSBGaXggRFJNX0ZPUk1BVF9NT0RfQU1MT0dJQ19GQkMgZGVmaW5pdGlvbi4KLSBGaXggbW9kZSBp
bml0aWFsaXphdGlvbiBpbiBvbWFwX2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkKCkuCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNo
cmlzdG9waCBIZWxsd2lnICgxKToKICAgICAgdmdhYXJiOiBtYXJrIHZnYV90cnlnZXQgc3RhdGlj
CgpDb2xpbiBJYW4gS2luZyAoMSk6CiAgICAgIGRybTogeGxueDogZml4IHNwZWxsaW5nIG1pc3Rh
a2UgImZhaWxlcyIgLT4gImZhaWxlZCIKCkh5dW4gS3dvbiAoMSk6CiAgICAgIGRybTogeGxueDog
enlucW1wOiBVc2Ugc3dpdGNoIC0gY2FzZSBmb3IgbGluayByYXRlIGRvd25zaGlmdAoKTGkgSGVu
ZyAoMSk6CiAgICAgIGRybTogUmVtb3ZlIHJlZHVuZGFudCBOVUxMIGNoZWNrCgpOZWlsIEFybXN0
cm9uZyAoMSk6CiAgICAgIGRybS9mb3VyY2M6IGZpeCBBbWxvZ2ljIFZpZGVvIEZyYW1lYnVmZmVy
IENvbXByZXNzaW9uIG1hY3JvCgpUZXRzdW8gSGFuZGEgKDEpOgogICAgICBmYm1lbTogcHVsbCBm
YmNvbl91cGRhdGVfdmNzKCkgb3V0IG9mIGZiX3NldF92YXIoKQoKVmlsbGUgU3lyasOkbMOkICgx
KToKICAgICAgZHJtL29tYXA6IFVzZSB7fSB0byB6ZXJvIGluaXRpYWxpemUgdGhlIG1vZGUKCldl
aSBZb25nanVuICgxKToKICAgICAgZHJtOiB4bG54OiBGaXggdHlwbyBpbiBwYXJhbWV0ZXIgZGVz
Y3JpcHRpb24KClhpbiBYaW9uZyAoMSk6CiAgICAgIGRybTogZml4IGRybV9kcF9tc3RfcG9ydCBy
ZWZjb3VudCBsZWFrcyBpbiBkcm1fZHBfbXN0X2FsbG9jYXRlX3ZjcGkKCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jICAgIHwgIDcgKysrKy0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9kcnYuYyAgICAgICAgICAgICAgICB8ICAzICstLQogZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9jb25uZWN0b3IuYyB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBf
ZHAuYyAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L3ZnYS92Z2FhcmIuYyAgICAgICAgICAgICAgICAgfCAgMyArLS0KIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY29yZS9mYm1lbS5jICAgICAgICAgfCAgOCArKy0tLS0tLQogZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2Zic3lzZnMuYyAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvcHMzZmIuYyAgICAgICAgICAgICAgfCAgNSArKystLQogaW5jbHVkZS9saW51eC9mYi5oICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyIC0tCiBpbmNsdWRlL2xpbnV4L3ZnYWFyYi5oICAgICAg
ICAgICAgICAgICAgIHwgIDYgLS0tLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCAg
ICAgICAgICAgIHwgIDIgKy0KIDExIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDQy
IGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
