Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B2A17414
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07738982E;
	Wed,  8 May 2019 08:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092066034.outbound.protection.outlook.com [40.92.66.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35126E5BB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 10:15:19 +0000 (UTC)
Received: from DB5EUR01FT021.eop-EUR01.prod.protection.outlook.com
 (10.152.4.54) by DB5EUR01HT196.eop-EUR01.prod.protection.outlook.com
 (10.152.5.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.11; Tue, 7 May
 2019 10:15:17 +0000
Received: from DB7PR08MB3801.eurprd08.prod.outlook.com (10.152.4.53) by
 DB5EUR01FT021.mail.protection.outlook.com (10.152.4.245) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 10:15:17 +0000
Received: from DB7PR08MB3801.eurprd08.prod.outlook.com
 ([fe80::ec8f:b095:615a:589e]) by DB7PR08MB3801.eurprd08.prod.outlook.com
 ([fe80::ec8f:b095:615a:589e%2]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 10:15:17 +0000
From: David Binderman <dcb314@hotmail.com>
To: "FlorianSchandinat@gmx.de" <FlorianSchandinat@gmx.de>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: linux-5.1/drivers/video/fbdev/via/viafbdev.c:233: bad assignment ?
Thread-Topic: linux-5.1/drivers/video/fbdev/via/viafbdev.c:233: bad assignment
 ?
Thread-Index: AQHVBL18sGm4+egm+kOaICMCRc2Jdg==
Date: Tue, 7 May 2019 10:15:16 +0000
Message-ID: <DB7PR08MB38014C16527534BDE1F48EE09C310@DB7PR08MB3801.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:3BA13D25E2C544871CCA1A8735EC949CFDEC2F90CBDF4CAE7198C9DC98195682;
 UpperCasedChecksum:1692FA88D36213C1A61C577BA05C51C636F4719BD8205FDDCC63CDCB71E73D69;
 SizeAsReceived:7013; Count:41
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [T+kXpIbvYnvwcrEu28ENQiTZssOO0g4FACJDJ0a98C6wco7iUgPIfkVOB2YQbish]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:DB5EUR01HT196; 
x-ms-traffictypediagnostic: DB5EUR01HT196:
x-microsoft-antispam-message-info: X53+rq7iGt2mODJqAvT0OiLEWqIDoVdVCnYtI+Btpykgjjx6DqC7+rCQzmimyY9VcdxQJ1hnrd723vt4b8y+wW+ymPJxaRG4dvZkVRkbLCgwJCtDBEc4qcnAOB3E4ERQnZXfOtM3c4YNRVpv57dzN/S0TbjvdX91MTuwxyU4eDRB+KNhP1PL3zBzmUqyXi5F
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7972a514-7c32-47b3-df83-08d6d2d4e70b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 10:15:16.9988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT196
X-Mailman-Approved-At: Wed, 08 May 2019 08:41:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8EBLxutSplygG0oRhRESgms6svNsb4GRdAUPX3No64=;
 b=P9EjFeXhDcH+HWBw1krJXFRj1GNglCznzmFyxupI2kjvvXJyNul3O4V2fZz2B/ork9eu1UeWNbLGcDmBhuEo67gETJYEWv2bSO6lit7UtW/cOFe5q4X821AKTMCX9m7/BaQHpE1KMq5dliKeBRW9LezUJYp1GJtrOdsZD/qA0pNH5CaYhnWGc3miwgIWr0sYqg03TzgoYuMXE/SyyOP7CO18x+AFoP/MsUMoHOsMjoATu/TCWbuyaeiN8NrJJ1s7+OBdNZ3ehN5Rh4fhP232W/XtlKE/XaTGO1h+SjgVAyXLT8WpfzznZzpB6W3zkt0deWuvwvuat0Eu9HspzkfDgg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gdGhlcmUsCgpbbGludXgtNS4xL2RyaXZlcnMvdmlkZW8vZmJkZXYvdmlhL3ZpYWZiZGV2
LmM6MjMzXTogKHN0eWxlKSBBc3NpZ25tZW50ICdkZXB0aD0zMCcgaXMgcmVkdW5kYW50IHdpdGgg
Y29uZGl0aW9uICdkZXB0aD09MzAnLgoKU291cmNlIGNvZGUgaXMKCiAgICAgICAgZWxzZSBpZiAo
ZGVwdGggPT0gMzApCiAgICAgICAgICAgICAgICBkZXB0aCA9IDMwOwoKU3VnZ2VzdCBjb2RlIHJl
d29yay4KClJlZ2FyZHMKCkRhdmlkIEJpbmRlcm1hbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
