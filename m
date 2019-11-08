Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E9CF41B9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198236F861;
	Fri,  8 Nov 2019 08:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B856F814
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 00:03:09 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko.stuebner@theobroma-systems.com>)
 id 1iSrk2-00065H-5Q; Fri, 08 Nov 2019 01:03:06 +0100
From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To: dri-devel@lists.freedesktop.org,
	a.hajda@samsung.com
Subject: [PATCH v2 4/5] dt-bindings: display: rockchip-dsi: add px30 compatible
Date: Fri,  8 Nov 2019 01:02:52 +0100
Message-Id: <20191108000253.8560-5-heiko.stuebner@theobroma-systems.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108000253.8560-1-heiko.stuebner@theobroma-systems.com>
References: <20191108000253.8560-1-heiko.stuebner@theobroma-systems.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 philippe.cornu@st.com, yannick.fertre@st.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-arm-kernel@lists.infradead.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB4MzAgU29DIGFsc28gdXNlcyBhIGR3LW1pcGktZHNpIGNvbnRyb2xsZXIsIHNvIGFkZCB0
aGUKY29tcGF0aWJsZSB2YWx1ZSBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5l
ciA8aGVpa28uc3R1ZWJuZXJAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgotLS0KIC4uLi9iaW5kaW5n
cy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4dCAgICAgIHwgNiArKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2No
aXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0CmluZGV4IDFi
YTkyMzdkMGFjMC4uMTUxYmUzYmJhMDZmIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAv
ZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0CkBAIC00LDggKzQsMTAgQEAgUm9ja2NoaXAgc3BlY2lm
aWMgZXh0ZW5zaW9ucyB0byB0aGUgU3lub3BzeXMgRGVzaWdud2FyZSBNSVBJIERTSQogUmVxdWly
ZWQgcHJvcGVydGllczoKIC0gI2FkZHJlc3MtY2VsbHM6IFNob3VsZCBiZSA8MT4uCiAtICNzaXpl
LWNlbGxzOiBTaG91bGQgYmUgPDA+LgotLSBjb21wYXRpYmxlOiAicm9ja2NoaXAscmszMjg4LW1p
cGktZHNpIiwgInNucHMsZHctbWlwaS1kc2kiLgotCSAgICAgICJyb2NrY2hpcCxyazMzOTktbWlw
aS1kc2kiLCAic25wcyxkdy1taXBpLWRzaSIuCistIGNvbXBhdGlibGU6IG9uZSBvZgorCSJyb2Nr
Y2hpcCxweDMwLW1pcGktZHNpIiwgInNucHMsZHctbWlwaS1kc2kiCisJInJvY2tjaGlwLHJrMzI4
OC1taXBpLWRzaSIsICJzbnBzLGR3LW1pcGktZHNpIgorCSJyb2NrY2hpcCxyazMzOTktbWlwaS1k
c2kiLCAic25wcyxkdy1taXBpLWRzaSIKIC0gcmVnOiBSZXByZXNlbnQgdGhlIHBoeXNpY2FsIGFk
ZHJlc3MgcmFuZ2Ugb2YgdGhlIGNvbnRyb2xsZXIuCiAtIGludGVycnVwdHM6IFJlcHJlc2VudCB0
aGUgY29udHJvbGxlcidzIGludGVycnVwdCB0byB0aGUgQ1BVKHMpLgogLSBjbG9ja3MsIGNsb2Nr
LW5hbWVzOiBQaGFuZGxlcyB0byB0aGUgY29udHJvbGxlcidzIHBsbCByZWZlcmVuY2UKLS0gCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
