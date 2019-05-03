Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868FA14529
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D463B89221;
	Mon,  6 May 2019 07:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 307 seconds by postgrey-1.36 at gabe;
 Fri, 03 May 2019 15:53:04 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3D36E801
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 15:53:04 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 44wc3G4Z08z1rYWw;
 Fri,  3 May 2019 17:47:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 44wc3G3zq6z1qtf0;
 Fri,  3 May 2019 17:47:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id LF8oQFI9RBcL; Fri,  3 May 2019 17:47:53 +0200 (CEST)
X-Auth-Info: Do7dPbj9putD9hqyhF07qwHvll/bcrHuEUUlbo370WQ=
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz
 [86.49.110.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  3 May 2019 17:47:53 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: display: Add ETM0700G0DH6 compatible string
Date: Fri,  3 May 2019 17:47:49 +0200
Message-Id: <20190503154749.5630-1-marex@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
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
cGxheS9wYW5lbC9lZHQsZXQtc2VyaWVzLnR4dAppbmRleCBkOWYyMWQ2MjQyMmUuLjRjYmI5ZGNi
YjM0NCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvZWR0LGV0LXNlcmllcy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvZWR0LGV0LXNlcmllcy50eHQKQEAgLTMyLDcgKzMyLDcg
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
