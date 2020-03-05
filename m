Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D1017A33F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 11:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3429B8926E;
	Thu,  5 Mar 2020 10:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8758922B;
 Thu,  5 Mar 2020 10:35:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 02:35:34 -0800
X-IronPort-AV: E=Sophos;i="5.70,517,1574150400"; d="scan'208";a="234374489"
Received: from bennur-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.38.13])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 02:35:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 05 Mar 2020 12:35:32 +0200
Message-ID: <87eeu7nl6z.fsf@intel.com>
MIME-Version: 1.0
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwgLQoKZHJtLWludGVsLWZpeGVzLTIwMjAtMDMtMDU6CmRybS9pOTE1
IGZpeGVzIGZvciB2NS42LXJjNToKLSBCcmVhayB1cCBsb25nIGxpc3RzIG9mIG9iamVjdCByZWNs
YWltIHdpdGggY29uZF9yZXNjaGVkKCkKLSBQU1IgcHJvYmUgZml4Ci0gVEdMIHdvcmthcm91bmRz
Ci0gU2VsZnRlc3QgcmV0dXJuIHZhbHVlIGZpeAotIERyb3AgdGltZWxpbmUgbXV0ZXggd2hpbGUg
d2FpdGluZyBmb3IgcmV0aXJlbWVudAotIFdhaXQgZm9yIE9BIGNvbmZpZ3VyYXRpb24gY29tcGxl
dGlvbiBiZWZvcmUgd3JpdGVzIHRvIE9BIGJ1ZmZlcgoKQlIsCkphbmkuCgpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IDk4ZDU0ZjgxZTM2YmEzYmY5MjE3Mjc5MWViYTVjYTViZDgx
Mzk4OWI6CgogIExpbnV4IDUuNi1yYzQgKDIwMjAtMDMtMDEgMTY6Mzg6NDYgLTA2MDApCgphcmUg
YXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS1pbnRlbCB0YWdzL2RybS1pbnRlbC1maXhlcy0yMDIwLTAzLTA1
Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMTY5YzBhYTRiYzE3ZDM3MzcwZjU1MTg4
ZDkzMjdiOTlkNjBmZDlkNzoKCiAgZHJtL2k5MTUvZ3Q6IERyb3AgdGhlIHRpbWVsaW5lLT5tdXRl
eCBhcyB3ZSB3YWl0IGZvciByZXRpcmVtZW50ICgyMDIwLTAzLTA0IDEzOjQ5OjI2ICswMjAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpkcm0vaTkxNSBmaXhlcyBmb3IgdjUuNi1yYzU6Ci0gQnJlYWsgdXAgbG9uZyBsaXN0
cyBvZiBvYmplY3QgcmVjbGFpbSB3aXRoIGNvbmRfcmVzY2hlZCgpCi0gUFNSIHByb2JlIGZpeAot
IFRHTCB3b3JrYXJvdW5kcwotIFNlbGZ0ZXN0IHJldHVybiB2YWx1ZSBmaXgKLSBEcm9wIHRpbWVs
aW5lIG11dGV4IHdoaWxlIHdhaXRpbmcgZm9yIHJldGlyZW1lbnQKLSBXYWl0IGZvciBPQSBjb25m
aWd1cmF0aW9uIGNvbXBsZXRpb24gYmVmb3JlIHdyaXRlcyB0byBPQSBidWZmZXIKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
Q2hyaXMgV2lsc29uICg0KToKICAgICAgZHJtL2k5MTUvZ2VtOiBCcmVhayB1cCBsb25nIGxpc3Rz
IG9mIG9iamVjdCByZWNsYWltCiAgICAgIGRybS9pOTE1OiBQcm90ZWN0IGk5MTVfcmVxdWVzdF9h
d2FpdF9zdGFydCBmcm9tIGVhcmx5IHdhaXRzCiAgICAgIGRybS9pOTE1L3BlcmY6IFJlaW50cm9k
dWNlIHdhaXQgb24gT0EgY29uZmlndXJhdGlvbiBjb21wbGV0aW9uCiAgICAgIGRybS9pOTE1L2d0
OiBEcm9wIHRoZSB0aW1lbGluZS0+bXV0ZXggYXMgd2Ugd2FpdCBmb3IgcmV0aXJlbWVudAoKRGFu
IENhcnBlbnRlciAoMSk6CiAgICAgIGRybS9pOTE1L3NlbGZ0ZXN0czogRml4IHJldHVybiBpbiBh
c3NlcnRfbW1hcF9vZmZzZXQoKQoKSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSAoMSk6CiAgICAgIGRy
bS9pOTE1L3BzcjogRm9yY2UgUFNSIHByb2JlIG9ubHkgYWZ0ZXIgZnVsbCBpbml0aWFsaXphdGlv
bgoKTHVjYXMgRGUgTWFyY2hpICgxKToKICAgICAgZHJtL2k5MTUvdGdsOiBBZGQgV2FfMTYwODAw
ODA4NAoKTWF0dCBSb3BlciAoMik6CiAgICAgIGRybS9pOTE1OiBQcm9ncmFtIE1CVVMgd2l0aCBy
bXcgZHVyaW5nIGluaXRpYWxpemF0aW9uCiAgICAgIGRybS9pOTE1L3RnbDogQWRkIFdhXzIyMDEw
MTc4MjU5OnRnbAoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9w
b3dlci5jIHwgMjkgKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfcHNyLmMgICAgICAgICAgIHwgMjUgKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9wc3IuaCAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fb2JqZWN0LmMgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fbW1hbi5jIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2d0X3JlcXVlc3RzLmMgICAgICAgIHwgMTQgKysrKy0tCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC9pbnRlbF93b3JrYXJvdW5kcy5jICAgICAgICB8IDE5ICsrKy0tLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMgICAgICAgICAgICAgICAgICAgIHwgIDMg
KysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcGVyZi5jICAgICAgICAgICAgICAgICAg
IHwgNTggKysrKysrKysrKysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9w
ZXJmX3R5cGVzLmggICAgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9yZWcuaCAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3JlcXVlc3QuYyAgICAgICAgICAgICAgICB8IDQxICsrKysrKysrKystLS0tLQogMTMgZmls
ZXMgY2hhbmdlZCwgMTQyIGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQoKLS0gCkphbmkg
TmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
