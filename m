Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B337155453
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 10:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551066FBE1;
	Fri,  7 Feb 2020 09:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C300D6FBE0;
 Fri,  7 Feb 2020 09:13:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 01:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,412,1574150400"; d="scan'208";a="430783854"
Received: from sgillich-mobl.ger.corp.intel.com (HELO [10.249.38.221])
 ([10.249.38.221])
 by fmsmga005.fm.intel.com with ESMTP; 07 Feb 2020 01:13:22 -0800
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <672810c3-4212-0a46-337b-2cb855573fd2@linux.intel.com>
Date: Fri, 7 Feb 2020 10:13:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
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

ZHJtLW1pc2MtZml4ZXMtMjAyMC0wMi0wNzoKRml4ZXMgZm9yIHY1LjY6Ci0gUmV2ZXJ0IGFsbG93
X2ZiX21vZGlmaWVycyBpbiBzdW40aSwgYXMgaXQgY2F1c2VzIGEgcmVncmVzc2lvbiBmb3IgREUy
IGFuZCBERTMuCi0gRml4IG51bGwgcG9pbnRlciBkZXJlZiBpbiBkcm1fZHBfbXN0X3Byb2Nlc3Nf
dXBfcmVxKCkuClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYmRlZmNhMmQ4ZGMw
ZjgwYmJlNDllMDhiZjUyYTcxNzE0NjQ5MDcwNjoKCiAgZHJtL3BhbmZyb3N0OiBBZGQgdGhlIHBh
bmZyb3N0X2dlbV9tYXBwaW5nIGNvbmNlcHQgKDIwMjAtMDEtMjEgMTA6MzI6NTUgLTA2MDApCgph
cmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5m
cmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIHRhZ3MvZHJtLW1pc2MtZml4ZXMtMjAyMC0wMi0w
NwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDdlMGNmN2U5OTM2YzQzNThiMDg2MzM1
N2I5MGFhMTJhZmU2NDg5ZGE6CgogIGRybS9wYW5mcm9zdDogTWFrZSBzdXJlIHRoZSBzaHJpbmtl
ciBkb2VzIG5vdCByZWNsYWltIHJlZmVyZW5jZWQgQk9zICgyMDIwLTAyLTAzIDExOjIzOjIxICsw
MDAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpGaXhlcyBmb3IgdjUuNjoKLSBSZXZlcnQgYWxsb3dfZmJfbW9kaWZpZXJz
IGluIHN1bjRpLCBhcyBpdCBjYXVzZXMgYSByZWdyZXNzaW9uIGZvciBERTIgYW5kIERFMy4KLSBG
aXggbnVsbCBwb2ludGVyIGRlcmVmIGluIGRybV9kcF9tc3RfcHJvY2Vzc191cF9yZXEoKS4KCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KQm9yaXMgQnJlemlsbG9uICgxKToKICAgICAgZHJtL3BhbmZyb3N0OiBNYWtlIHN1cmUg
dGhlIHNocmlua2VyIGRvZXMgbm90IHJlY2xhaW0gcmVmZXJlbmNlZCBCT3MKCkplcm5laiBTa3Jh
YmVjICgxKToKICAgICAgUmV2ZXJ0ICJkcm0vc3VuNGk6IGRydjogQWxsb3cgZnJhbWVidWZmZXIg
bW9kaWZpZXJzIGluIG1vZGUgY29uZmlnIgoKSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSAoMSk6CiAg
ICAgIGRybS9tc3Q6IEZpeCBwb3NzaWJsZSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gZHJt
X2RwX21zdF9wcm9jZXNzX3VwX3JlcSgpCgogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyAgICAgICAgICAgIHwgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kcnYuYyAgICAgICAgICB8IDEgKwogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2dlbS5oICAgICAgICAgIHwgNiArKysrKysKIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9nZW1fc2hyaW5rZXIuYyB8IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3Rfam9iLmMgICAgICAgICAgfCA3ICsrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV9kcnYuYyAgICAgICAgICAgICAgICB8IDEgLQogNiBmaWxlcyBjaGFuZ2VkLCAxOCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
