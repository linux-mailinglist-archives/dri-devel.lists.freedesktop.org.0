Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D8116EF5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE306E462;
	Mon,  9 Dec 2019 14:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425606E461
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:32:29 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ieK5A-0000zC-KB; Mon, 09 Dec 2019 15:32:16 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: a.hajda@samsung.com
Subject: [PATCH v5 5/6] dt-bindings: display: rockchip-dsi: add px30 compatible
Date: Mon,  9 Dec 2019 15:31:29 +0100
Message-Id: <20191209143130.4553-6-heiko@sntech.de>
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
bT4KClRoZSBweDMwIFNvQyBhbHNvIHVzZXMgYSBkdy1taXBpLWRzaSBjb250cm9sbGVyLCBzbyBh
ZGQgdGhlCmNvbXBhdGlibGUgdmFsdWUgZm9yIGl0LgoKY2hhbmdlcyBpbiB2NToKLSByZWJhc2Vk
IG9uIHRvcCBvZiA1LjUtcmMxCi0gbWVyZ2VkIHdpdGggZHNpIHRpbWluZyBjaGFuZ2UgdG8gcHJl
dmVudCBvcmRlcmluZyBjb25mbGljdHMKClNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxo
ZWlrby5zdHVlYm5lckB0aGVvYnJvbWEtc3lzdGVtcy5jb20+CkFja2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3
X21pcGlfZHNpX3JvY2tjaGlwLnR4dCAgICAgIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2No
aXAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2No
aXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0CmluZGV4IDFiYTkyMzdkMGFjMC4uMTUxYmUzYmJh
MDZmIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yb2NrY2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAu
dHh0CkBAIC00LDggKzQsMTAgQEAgUm9ja2NoaXAgc3BlY2lmaWMgZXh0ZW5zaW9ucyB0byB0aGUg
U3lub3BzeXMgRGVzaWdud2FyZSBNSVBJIERTSQogUmVxdWlyZWQgcHJvcGVydGllczoKIC0gI2Fk
ZHJlc3MtY2VsbHM6IFNob3VsZCBiZSA8MT4uCiAtICNzaXplLWNlbGxzOiBTaG91bGQgYmUgPDA+
LgotLSBjb21wYXRpYmxlOiAicm9ja2NoaXAscmszMjg4LW1pcGktZHNpIiwgInNucHMsZHctbWlw
aS1kc2kiLgotCSAgICAgICJyb2NrY2hpcCxyazMzOTktbWlwaS1kc2kiLCAic25wcyxkdy1taXBp
LWRzaSIuCistIGNvbXBhdGlibGU6IG9uZSBvZgorCSJyb2NrY2hpcCxweDMwLW1pcGktZHNpIiwg
InNucHMsZHctbWlwaS1kc2kiCisJInJvY2tjaGlwLHJrMzI4OC1taXBpLWRzaSIsICJzbnBzLGR3
LW1pcGktZHNpIgorCSJyb2NrY2hpcCxyazMzOTktbWlwaS1kc2kiLCAic25wcyxkdy1taXBpLWRz
aSIKIC0gcmVnOiBSZXByZXNlbnQgdGhlIHBoeXNpY2FsIGFkZHJlc3MgcmFuZ2Ugb2YgdGhlIGNv
bnRyb2xsZXIuCiAtIGludGVycnVwdHM6IFJlcHJlc2VudCB0aGUgY29udHJvbGxlcidzIGludGVy
cnVwdCB0byB0aGUgQ1BVKHMpLgogLSBjbG9ja3MsIGNsb2NrLW5hbWVzOiBQaGFuZGxlcyB0byB0
aGUgY29udHJvbGxlcidzIHBsbCByZWZlcmVuY2UKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
