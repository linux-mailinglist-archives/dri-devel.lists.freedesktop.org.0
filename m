Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9AFFBFDD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 06:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6516E02F;
	Thu, 14 Nov 2019 05:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3DD6E02F;
 Thu, 14 Nov 2019 05:51:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 21:51:52 -0800
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; d="scan'208";a="198703121"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 21:51:51 -0800
Date: Wed, 13 Nov 2019 21:53:02 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20191114055302.GA3564@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSBhbmQgRGFuaWVsLAoKSGVyZSBnb2VzIGRybS1pbnRlbC1maXhlcy0yMDE5LTExLTEz
OgoKLSBNT0NTIHRhYmxlIGZpeGVzIGZvciBFSEwgYW5kIFRHTAotIFVwZGF0ZSBEaXNwbGF5J3Mg
cmF3Y2xvY2sgb24gcmVzdW1lCi0gR1ZUJ3MgZG1hYnVmIHJlZmVyZW5jZSBkcm9wIGZpeAoKVGhh
bmtzLApSb2RyaWdvLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzMWY0ZjVi
NDk1YTYyYzlhOGIxNWIxYzM1ODFhY2Q1ZWZlYjlhZjhjOgoKICBMaW51eCA1LjQtcmM3ICgyMDE5
LTExLTEwIDE2OjE3OjE1IC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFn
cy9kcm0taW50ZWwtZml4ZXMtMjAxOS0xMS0xMwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDFjNjAyMDA2ZDFkY2I3NTAxYWUxYzU2OWZkYWJlMWI4ZTFmMDgyYTQ6CgogIGRybS9pOTE1
L3RnbDogTU9DUyB0YWJsZSB1cGRhdGUgKDIwMTktMTEtMTMgMTM6MjM6MTIgLTA4MDApCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCi0gTU9DUyB0YWJsZSBmaXhlcyBmb3IgRUhMIGFuZCBUR0wKLSBVcGRhdGUgRGlzcGxheSdz
IHJhd2Nsb2NrIG9uIHJlc3VtZQotIEdWVCdzIGRtYWJ1ZiByZWZlcmVuY2UgZHJvcCBmaXgKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KSmFuaSBOaWt1bGEgKDEpOgogICAgICBkcm0vaTkxNTogdXBkYXRlIHJhd2NsayBhbHNv
IG9uIHJlc3VtZQoKTWF0dCBSb3BlciAoMik6CiAgICAgIFJldmVydCAiZHJtL2k5MTUvZWhsOiBV
cGRhdGUgTU9DUyB0YWJsZSBmb3IgRUhMIgogICAgICBkcm0vaTkxNS90Z2w6IE1PQ1MgdGFibGUg
dXBkYXRlCgpQYW4gQmlhbiAoMSk6CiAgICAgIGRybS9pOTE1L2d2dDogZml4IGRyb3BwaW5nIG9i
aiByZWZlcmVuY2UgdHdpY2UKClJvZHJpZ28gVml2aSAoMSk6CiAgICAgIE1lcmdlIHRhZyAnZ3Z0
LWZpeGVzLTIwMTktMTEtMTInIG9mIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXgg
aW50byBkcm0taW50ZWwtZml4ZXMKCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXlfcG93ZXIuYyB8ICAzICsrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxf
bW9jcy5jICAgICAgICAgICAgICAgfCAxMCArLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZG1hYnVmLmMgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZHJ2LmMgICAgICAgICAgICAgICAgICAgIHwgIDMgLS0tCiA0IGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
