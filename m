Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E85B116F02
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27AF6E471;
	Mon,  9 Dec 2019 14:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE7D6E466
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:32:33 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ieK59-0000zC-BJ; Mon, 09 Dec 2019 15:32:15 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: a.hajda@samsung.com
Subject: [PATCH v5 3/6] dt-bindings: display: rockchip-dsi: document external
 phys
Date: Mon,  9 Dec 2019 15:31:27 +0100
Message-Id: <20191209143130.4553-4-heiko@sntech.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209143130.4553-1-heiko@sntech.de>
References: <20191209143130.4553-1-heiko@sntech.de>
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
Cc: bivvy.bi@rock-chips.com, jernej.skrabec@siol.net, xzy.xu@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, jonas@kwiboo.se, sean@poorly.run,
 narmstrong@baylibre.com, philippe.cornu@st.com,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, yannick.fertre@st.com,
 linux-rockchip@lists.infradead.org, nickey.yang@rock-chips.com,
 eddie.cai@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHRoZW9icm9tYS1zeXN0ZW1zLmNv
bT4KClNvbWUgZHctbWlwaS1kc2kgaW5zdGFuY2VzIGluIFJvY2tjaGlwIFNvQ3MgdXNlIGV4dGVy
bmFsIGRwaHlzLgpJbiB0aGVzZSBjYXNlcyB0aGUgbmVlZHMgY2xvY2sgd2lsbCBhbHNvIGJlIGdl
bmVyYXRlZCBleHRlcm5hbGx5CnNvIHRoZXNlIGRvbid0IG5lZWQgdGhlIHJlZi1jbG9jayBhcyB3
ZWxsLgoKY2hhbmdlcyBpbiB2NToKLSByZWJhc2VkIG9uIHRvcCBvZiA1LjUtcmMxCi0gbWVyZ2Vk
IHdpdGggZHNpIHRpbWluZyBjaGFuZ2UgdG8gcHJldmVudCBvcmRlcmluZyBjb25mbGljdHMKClNp
Z25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB0aGVvYnJvbWEtc3lz
dGVtcy5jb20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0K
IC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4dCAg
ICAgfCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAu
dHh0CmluZGV4IGNlNGMxZmM5MTE2Yy4uMWJhOTIzN2QwYWMwIDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9kd19taXBpX2RzaV9y
b2NrY2hpcC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0CkBAIC05LDggKzksOSBAQCBSZXF1
aXJlZCBwcm9wZXJ0aWVzOgogLSByZWc6IFJlcHJlc2VudCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBy
YW5nZSBvZiB0aGUgY29udHJvbGxlci4KIC0gaW50ZXJydXB0czogUmVwcmVzZW50IHRoZSBjb250
cm9sbGVyJ3MgaW50ZXJydXB0IHRvIHRoZSBDUFUocykuCiAtIGNsb2NrcywgY2xvY2stbmFtZXM6
IFBoYW5kbGVzIHRvIHRoZSBjb250cm9sbGVyJ3MgcGxsIHJlZmVyZW5jZQotICBjbG9jayhyZWYp
IGFuZCBBUEIgY2xvY2socGNsaykuIEZvciBSSzMzOTksIGEgcGh5IGNvbmZpZyBjbG9jawotICAo
cGh5X2NmZykgYW5kIGEgZ3JmIGNsb2NrKGdyZikgYXJlIHJlcXVpcmVkLiBBcyBkZXNjcmliZWQg
aW4gWzFdLgorICBjbG9jayhyZWYpIHdoZW4gdXNpbmcgYW4gaW50ZXJuYWwgZHBoeSBhbmQgQVBC
IGNsb2NrKHBjbGspLgorICBGb3IgUkszMzk5LCBhIHBoeSBjb25maWcgY2xvY2sgKHBoeV9jZmcp
IGFuZCBhIGdyZiBjbG9jayhncmYpCisgIGFyZSByZXF1aXJlZC4gQXMgZGVzY3JpYmVkIGluIFsx
XS4KIC0gcm9ja2NoaXAsZ3JmOiB0aGlzIHNvYyBzaG91bGQgc2V0IEdSRiByZWdzIHRvIG11eCB2
b3BsL3ZvcGIuCiAtIHBvcnRzOiBjb250YWluIGEgcG9ydCBub2RlIHdpdGggZW5kcG9pbnQgZGVm
aW5pdGlvbnMgYXMgZGVmaW5lZCBpbiBbMl0uCiAgIEZvciB2b3BiLHNldCB0aGUgcmVnID0gPDA+
IGFuZCBzZXQgdGhlIHJlZyA9IDwxPiBmb3Igdm9wbC4KQEAgLTE4LDYgKzE5LDggQEAgUmVxdWly
ZWQgcHJvcGVydGllczoKIC0gdmlkZW8gcG9ydCAxIGZvciBlaXRoZXIgYSBwYW5lbCBvciBzdWJz
ZXF1ZW50IGVuY29kZXIKIAogT3B0aW9uYWwgcHJvcGVydGllczoKKy0gcGh5czogZnJvbSBnZW5l
cmFsIFBIWSBiaW5kaW5nOiB0aGUgcGhhbmRsZSBmb3IgdGhlIFBIWSBkZXZpY2UuCistIHBoeS1u
YW1lczogU2hvdWxkIGJlICJkcGh5IiBpZiBwaHlzIHJlZmVyZW5jZXMgYW4gZXh0ZXJuYWwgcGh5
LgogLSBwb3dlci1kb21haW5zOiBhIHBoYW5kbGUgdG8gbWlwaSBkc2kgcG93ZXIgZG9tYWluIG5v
ZGUuCiAtIHJlc2V0czogbGlzdCBvZiBwaGFuZGxlICsgcmVzZXQgc3BlY2lmaWVyIHBhaXJzLCBh
cyBkZXNjcmliZWQgaW4gWzNdLgogLSByZXNldC1uYW1lczogc3RyaW5nIHJlc2V0IG5hbWUsIG11
c3QgYmUgImFwYiIuCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
