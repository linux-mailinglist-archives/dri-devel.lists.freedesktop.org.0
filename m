Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB334A9E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE6789949;
	Tue,  4 Jun 2019 14:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id A5BB389949
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 14:42:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 862A5341;
 Tue,  4 Jun 2019 07:42:07 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5600D3F690;
 Tue,  4 Jun 2019 07:42:07 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id A0E99682258; Tue,  4 Jun 2019 15:42:05 +0100 (BST)
Date: Tue, 4 Jun 2019 15:42:05 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [GIT PULL] v5.2 fixes for Arm drivers
Message-ID: <20190604144205.GO15316@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Wen He <wen.he_1@nxp.com>, DRI devel <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 MaliDP Maintainers <malidp@foss.arm.com>,
 "Lowry Li \(Arm Technology China\)" <lowry.li@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gRFJNIG1haW50YWluZXJzLAoKSSBoYXZlIGNvbGxlY3RlZCBhbiBhc3NvcnRlZCBzZXQg
b2YgcGF0Y2hlcyBmb3IgQXJtIERSTSBkcml2ZXJzIHRoYXQgSSBtYWludGFpbgppbiBteSB0cmVl
LCBzbyBpdCdzIHRpbWUgdG8gZmx1c2ggdGhlbSBvdXQuIFBsZWFzZSBwdWxsIQoKQmVzdCByZWdh
cmRzLApMaXZpdQoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMmEzZTBiNzE2
Mjk2YTUwNGQ5ZTY1ZmVhN2FjYjM3OWM4NmZlNDI4MzoKCiAgTWVyZ2UgdGFnICdpbXgtZHJtLWZp
eGVzLTIwMTktMDUtMjknIG9mIGdpdDovL2dpdC5wZW5ndXRyb25peC5kZS9naXQvcHphL2xpbnV4
IGludG8gZHJtLWZpeGVzICgyMDE5LTA1LTMxIDA5OjE1OjI1ICsxMDAwKQoKYXJlIGF2YWlsYWJs
ZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2xpbnV4LWFybS5vcmcvbGludXgt
bGQuZ2l0IG1hbGlkcC1maXhlcwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGM0M2Rl
NjM2YTQ2OWE0MmM3YjA0MGM4ZDQ4ZWRhNmQ1YzM5NzdiOWM6CgogIGRybS9rb21lZGE6IFBvdGVu
dGlhbCBlcnJvciBwb2ludGVyIGRlcmVmZXJlbmNlICgyMDE5LTA2LTA0IDE1OjE5OjQwICswMTAw
KQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpEYW4gQ2FycGVudGVyICgxKToKICAgICAgZHJtL2tvbWVkYTogUG90ZW50aWFs
IGVycm9yIHBvaW50ZXIgZGVyZWZlcmVuY2UKCkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGlu
YSkgKDEpOgogICAgICBkcm0va29tZWRhOiBmaXhpbmcgb2YgRE1BIG1hcHBpbmcgc2cgc2VnbWVu
dCB3YXJuaW5nCgpSb2JpbiBNdXJwaHkgKDIpOgogICAgICBkcm0vYXJtL2hkbGNkOiBBY3R1YWxs
eSB2YWxpZGF0ZSBDUlRDIG1vZGVzCiAgICAgIGRybS9hcm0vaGRsY2Q6IEFsbG93IGEgYml0IG9m
IGNsb2NrIHRvbGVyYW5jZQoKV2VuIEhlICgxKToKICAgICAgZHJtL2FybS9tYWxpLWRwOiBBZGQg
YSBsb29wIGFyb3VuZCB0aGUgc2Vjb25kIHNldCBDVkFMIGFuZCB0cnkgNSB0aW1lcwoKWXVlSGFp
YmluZyAoMSk6CiAgICAgIGRybS9rb21lZGE6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlh
YmxlICdrY3J0YycKCmphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgxKToK
ICAgICAgZHJtL2tvbWVkYTogQ29uc3RpZnkgdGhlIHVzYWdlIG9mIGtvbWVkYV9jb21wb25lbnQv
cGlwZWxpbmUvZGV2X2Z1bmNzCgogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9k
NzEvZDcxX2NvbXBvbmVudC5jIHwgIDggKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgICAgICB8ICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyAgICAgICAgfCAgNiArKysr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgICAg
ICB8ICA4ICsrKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9waXBlbGluZS5jICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9waXBlbGluZS5oICAgfCAxMCArKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jICAgICAgfCAgNCArLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYXJtL2hkbGNkX2NydGMuYyAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysr
KysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTMgKysrKysrKysrKysrLQogMTAgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0
aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291
bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdp
dmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAg
wq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
