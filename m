Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E307107540
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 16:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9906E392;
	Fri, 22 Nov 2019 15:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179A36E37F;
 Fri, 22 Nov 2019 15:55:29 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 07:55:29 -0800
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; d="scan'208";a="201560836"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.11.80])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 07:55:25 -0800
Date: Fri, 22 Nov 2019 17:55:23 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20191122155523.GA20167@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
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

SGkgRGF2ZSAmIERhbmllbCwKCkEgcXVpY2sgZml4dXAgYW1lbmRtZW50IHRvIHRoZSBwcmV2aW91
cyBQUi4gZ2VtX2V4ZWNfcmVsb2MvYmFzaWMtcmFuZ2UKZ290IGJyb2tlbiBpbiBDSSwgc28gd2Un
dmUgaXNzdWVkIGEgcGF0Y2ggcmV2ZXJ0IHRoZSBvZmZlbmRpbmcgY29tbWl0CmZvciBub3cuCgpP
bmNlIHRoZSByZXN1bHRzIGZvciBDSV9ESU5GXzE2MyBhcHBlYXIgaGVyZSwgYW5kIHRoZSB0aW1l
b3V0cyBzZWVuCmluIGxhc3QgdGhyZWUgQ0lfRElORl8gYXJlIGdyZWVuLCBmZWVsIGZyZWUgdG8g
cHVsbCB0aGlzOgoKaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLWludGVsLW5l
eHQtZml4ZXMvY29tYmluZWQtYWx0Lmh0bWw/dGVzdGZpbHRlcj1nZW1fZXhlY19yZWxvYwoKSXQg
aXMgcmF0aGVyIGEgY29ybmVyLWNhc2UsIHNvIG5vIGltcGFjdCBiZXlvbmQgQ0kgY3VycmVudGx5
IGtub3duLgoKUmVnYXJkcywgSm9vbmFzCgoqKioKCmRybS1pbnRlbC1uZXh0LWZpeGVzLTIwMTkt
MTEtMjI6CgotIFJldmVydHMgYSBwYXRjaCB0byBhdm9pZCBzcGlubmluZyBmb3JldmVyIHdoZW4g
Y29udGV4dCdzIHRpbWVsaW5lCiAgaXMgYWN0aXZlIGJ1dCBoYXMgbm8gcmVxdWVzdHMKClRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMDEyMmJhYWE5M2NjNjgxZmFhY2UwNjRlYzI1
ZDE2YmI1Yzk4MjVhYjoKCiAgTWVyZ2UgdGFnICdndnQtbmV4dC1maXhlcy0yMDE5LTExLTEyJyBv
ZiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4IGludG8gZHJtLWludGVsLW5leHQt
Zml4ZXMgKDIwMTktMTEtMjAgMTM6MjE6MzggKzAyMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBH
aXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2Ry
bS1pbnRlbCB0YWdzL2RybS1pbnRlbC1uZXh0LWZpeGVzLTIwMTktMTEtMjIKCmZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byAxNWI5Y2JiMmM1ZTFjZjIyYzEzZmUzOGJmNTEzYmFiODIxYjQ3
NjMwOgoKICBSZXZlcnQgImRybS9pOTE1L2d0OiBXYWl0IGZvciBuZXcgcmVxdWVzdHMgaW4gaW50
ZWxfZ3RfcmV0aXJlX3JlcXVlc3RzKCkiICgyMDE5LTExLTIyIDE3OjI0OjIyICswMjAwKQoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQotIFJldmVydHMgYSBwYXRjaCB0byBhdm9pZCBzcGlubmluZyBmb3JldmVyIHdoZW4gY29u
dGV4dCdzIHRpbWVsaW5lCiAgaXMgYWN0aXZlIGJ1dCBoYXMgbm8gcmVxdWVzdHMKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
Q2hyaXMgV2lsc29uICgxKToKICAgICAgUmV2ZXJ0ICJkcm0vaTkxNS9ndDogV2FpdCBmb3IgbmV3
IHJlcXVlc3RzIGluIGludGVsX2d0X3JldGlyZV9yZXF1ZXN0cygpIgoKIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2d0X3JlcXVlc3RzLmMgfCA5ICsrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
