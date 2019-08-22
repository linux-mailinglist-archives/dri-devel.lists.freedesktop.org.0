Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A8198EA4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871CF6EA41;
	Thu, 22 Aug 2019 09:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5826E433;
 Thu, 22 Aug 2019 09:04:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 02:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="196190620"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2019 02:04:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 22 Aug 2019 12:04:07 +0300
Message-ID: <87sgptd114.fsf@intel.com>
MIME-Version: 1.0
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpIERhdmUgJiBEYW5pZWwgLQoKZHJtLWludGVsLWZpeGVzLTIwMTktMDgtMjI6CmRybS9pOTE1
IGZpeGVzIGZvciB2NS4zLXJjNjoKLSBmaXggaGFyZHdhcmUgc3RhdGUgcmVhZG91dCBmb3IgMTAg
YnBjIEhETUkKCkJSLApKYW5pLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBk
MWFiYWViM2JlN2I1ZmE2ZDdhMWZiYmQyZTE0ZTMzMTAwMDVjNGMxOgoKICBMaW51eCA1LjMtcmM1
ICgyMDE5LTA4LTE4IDE0OjMxOjA4IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6CgogIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50
ZWwgdGFncy9kcm0taW50ZWwtZml4ZXMtMjAxOS0wOC0yMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIGVkMTllMzAzNWM1YTE2MDM0ZTg5NmVlZDI4YzVlNzJlMDJlMmZmNTg6CgogIGRy
bS9pOTE1OiBGaXggSFcgcmVhZG91dCBmb3IgY3J0Y19jbG9jayBpbiBIRE1JIG1vZGUgKDIwMTkt
MDgtMjEgMTI6MzA6NDggKzAzMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRybS9pOTE1IGZpeGVzIGZvciB2NS4zLXJj
NjoKLSBmaXggaGFyZHdhcmUgc3RhdGUgcmVhZG91dCBmb3IgMTAgYnBjIEhETUkKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
SW1yZSBEZWFrICgxKToKICAgICAgZHJtL2k5MTU6IEZpeCBIVyByZWFkb3V0IGZvciBjcnRjX2Ns
b2NrIGluIEhETUkgbW9kZQoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRp
LmMgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rydi5oICAgICAgICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0t
IApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
