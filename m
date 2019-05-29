Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8551F2DBA9
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02046E2E6;
	Wed, 29 May 2019 11:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FAA6E0CF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:26:17 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45DRh73yGqz1rJ78;
 Wed, 29 May 2019 12:26:15 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45DRh73VHQz1qqkp;
 Wed, 29 May 2019 12:26:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id CfurZjzY8LnY; Wed, 29 May 2019 12:26:14 +0200 (CEST)
X-Auth-Info: Vk0zqBZ8amlFVaT33yycQxDuIwxajVTrwTwaF0PGk5E=
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz
 [86.49.110.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 29 May 2019 12:26:14 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: display: Add ETM0700G0DH6 compatible string
Date: Wed, 29 May 2019 12:25:40 +0200
Message-Id: <20190529102540.4608-1-marex@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
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
Cc: Marek Vasut <marex@denx.de>, Thierry Reding <treding@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, Jan Tuerk <jan.tuerk@emtrion.com>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEVUTTA3MDBHMERINiBpcyBjdXJyZW50bHkgZG9jdW1lbnRlZCBhcyB1c2luZyBlZHQsZXRt
MDcwMDgwZGg2CmNvbXBhdGlibGUgc3RyaW5nLCBob3dldmVyIHRoZSBMaW51eCBrZXJuZWwgZHJp
dmVyIGFzIHdlbGwgYXMgYQpjb3VwbGUgb2YgRFRzIHVzZSBlZHQsZXRtMDcwMGcwZGg2IGNvbXBh
dGlibGUgc3RyaW5nLiBBZGQgaXQgaW50bwp0aGUgZG9jdW1lbnRhdGlvbi4KClNpZ25lZC1vZmYt
Ynk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgpDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRA
a2VybmVsLm9yZz4KQ2M6IEphbiBUdWVyayA8amFuLnR1ZXJrQGVtdHJpb24uY29tPgpDYzogVGhp
ZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KQ2M6IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnClRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQogLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9lZHQsZXQtc2VyaWVzLnR4dCAgICAgICAgIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
ZWR0LGV0LXNlcmllcy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9lZHQsZXQtc2VyaWVzLnR4dAppbmRleCBiZTg2ODQzMjdlZTQuLmI3YWMxYzcy
NWY5NyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvZWR0LGV0LXNlcmllcy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZWR0LGV0LXNlcmllcy50eHQKQEAgLTQwLDcgKzQwLDcg
QEAgc2ltcGxlLXBhbmVsLnR4dAogfCBJZGVudGlmaWVyICAgICAgfCBjb21wYXRiaWxlICAgICAg
ICAgIHwgZGVzY3JpcHRpb24gICAgICAgICAgICAgICAgICAgICAgICAgfAogKz09PT09PT09PT09
PT09PT09Kz09PT09PT09PT09PT09PT09PT09PSs9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09KwogfCBFVE0wNzAwRzBESDYgICAgfCBlZHQsZXRtMDcwMDgwZGg2ICAgIHwgV1ZH
QSBURlQgRGlzcGxheSB3aXRoIGNhcGFjaXRpdmUgICAgfAotfCAgICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgIHwgVG91Y2hzY3JlZW4gICAgICAgICAgICAgICAgICAgICAgICAg
fAorfCAgICAgICAgICAgICAgICAgfCBlZHQsZXRtMDcwMGcwZGg2ICAgIHwgVG91Y2hzY3JlZW4g
ICAgICAgICAgICAgICAgICAgICAgICAgfAogKy0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwogfCBFVE0w
NzAwRzBCREg2ICAgfCBlZHQsZXRtMDcwMDgwYmRoNiAgIHwgU2FtZSBhcyBFVE0wNzAwRzBESDYg
YnV0IHdpdGggICAgICAgfAogfCAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
IHwgaW52ZXJ0ZWQgcGl4ZWwgY2xvY2suICAgICAgICAgICAgICAgfAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
