Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF9E116F3E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CB16E47E;
	Mon,  9 Dec 2019 14:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133156E47A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:42:29 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ieKEx-00016m-7Z; Mon, 09 Dec 2019 15:42:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: thierry.reding@gmail.com,
	sam@ravnborg.org
Subject: [PATCH 1/3] dt-bindings: Add vendor prefix for Xinpeng Technology
Date: Mon,  9 Dec 2019 15:42:06 +0100
Message-Id: <20191209144208.4863-1-heiko@sntech.de>
X-Mailer: git-send-email 2.24.0
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRoZW9icm9tYS1zeXN0ZW1zLmNv
bT4KClNoZW56aGVuIFhpbnBlbmcgVGVjaG5vbG9neSBDby4sIEx0ZCBwcm9kdWNlcyBmb3IgZXhh
bXBsZSBkaXNwbGF5IHBhbmVscy4KClNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlr
by5zdHVlYm5lckB0aGVvYnJvbWEtc3lzdGVtcy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAppbmRleCA2MDQ2ZjQ1NTU4NTIuLjg1ZTdj
MjZhMDVjNyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Zl
bmRvci1wcmVmaXhlcy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbApAQCAtMTA1Niw2ICsxMDU2LDggQEAgcGF0dGVyblByb3Bl
cnRpZXM6CiAgICAgZGVzY3JpcHRpb246IEV4dHJlbWUgRW5naW5lZXJpbmcgU29sdXRpb25zIChY
LUVTKQogICAiXnhpbGx5YnVzLC4qIjoKICAgICBkZXNjcmlwdGlvbjogWGlsbHlidXMgTHRkLgor
ICAiXnhpbnBlbmcsLioiOgorICAgIGRlc2NyaXB0aW9uOiBTaGVuemhlbiBYaW5wZW5nIFRlY2hu
b2xvZ3kgQ28uLCBMdGQKICAgIl54bG54LC4qIjoKICAgICBkZXNjcmlwdGlvbjogWGlsaW54CiAg
ICJeeHVubG9uZywuKiI6Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
