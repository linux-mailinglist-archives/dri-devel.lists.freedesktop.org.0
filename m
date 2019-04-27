Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B46B3A5
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 15:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEC7891F2;
	Sat, 27 Apr 2019 13:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810073.outbound.protection.outlook.com [40.107.81.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4357D891E1;
 Sat, 27 Apr 2019 13:49:29 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1940.namprd12.prod.outlook.com (10.175.96.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Sat, 27 Apr 2019 13:49:27 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1835.010; Sat, 27 Apr
 2019 13:49:27 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 4.19 29/53] drm/amdkfd: Add picasso pci id
Thread-Topic: [PATCH AUTOSEL 4.19 29/53] drm/amdkfd: Add picasso pci id
Thread-Index: AQHU/Jpiylo526cPvE+FZxga04cllqZQBqhe
Date: Sat, 27 Apr 2019 13:49:27 +0000
Message-ID: <BN6PR12MB18098B1A85760FCFFFDD3C37F73F0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190427014051.7522-1-sashal@kernel.org>,
 <20190427014051.7522-29-sashal@kernel.org>
In-Reply-To: <20190427014051.7522-29-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2574804-7029-4adc-96bb-08d6cb172a77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1940; 
x-ms-traffictypediagnostic: BN6PR12MB1940:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1940D050F346ADE7CF37B392F73F0@BN6PR12MB1940.namprd12.prod.outlook.com>
x-forefront-prvs: 0020414413
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(366004)(396003)(376002)(39860400002)(189003)(199004)(97736004)(446003)(3846002)(229853002)(68736007)(2201001)(105004)(86362001)(2501003)(476003)(6116002)(33656002)(6436002)(2906002)(71200400001)(486006)(71190400001)(256004)(478600001)(76116006)(14454004)(72206003)(11346002)(966005)(66946007)(8936002)(54906003)(316002)(73956011)(52536014)(110136005)(7696005)(19627405001)(99286004)(6246003)(76176011)(66446008)(606006)(81166006)(5660300002)(53936002)(186003)(26005)(236005)(9686003)(74316002)(66476007)(7736002)(6306002)(55016002)(54896002)(66066001)(53546011)(8676002)(6506007)(4326008)(81156014)(25786009)(102836004)(64756008)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1940;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o25fqV95UsPAzVqSGSJ5WMRVUfZ/jxgJ5N9bAemq2hfZa5aOMQRup1Cjacg00qEIaNmUN/PBzA0uA4gqJBj3tBoUJofZrFWA2nLBya4u9ATymbHkeIbVTEvNk9jV+Lga7MmgIg1PzmW5jmU28E4QL93YpTvFjWrHHo6WYTE+Kc/eLY0xeg+FPxpV+BjWKTwzadDbUOkHvFTaKle7aAgh3RCo5H2djBfIPF1aZq3PUz8F0mXkif3XxTpanaeM01eWoZ87m0kc03bTBaJqWcWfSGekucSlfPt85rh+afVAv1fr+eyI0M7MIKpQ0FAU875bLnaXL9wOcLIZ15PLo4fRtgLfiqLmUXrYtGzJcBEH+KSb+aFP1bE5f64kA3Jik7c/h7r7v12XmKemk+AeVRNgS2KBrZa5EietrkTJ4tqoDYs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2574804-7029-4adc-96bb-08d6cb172a77
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2019 13:49:27.5049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1940
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rH7k4RUXEGOpwpC9UcXGvOiK5HzAU8T1kjz7dkcl8RI=;
 b=F+QbUlJ6U3bk6cSajBrgSTMkXU2hN6yRPNC3IYk2fSvWmybOlF+NdPksLbbmKL5ZpbMXbB4POgZuh/mHUgZukaXKnghvP7tffmM5C7NoO6I9DxzaOWIqDY4Ig5EGONwfIi6SKLm9cOcAUtQrBppdQ1EfXA5Qr1uWy78KlN0bsGM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0145598172=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0145598172==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18098B1A85760FCFFFDD3C37F73F0BN6PR12MB1809namp_"

--_000_BN6PR12MB18098B1A85760FCFFFDD3C37F73F0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NACK.  4.19 did not contain support for picasso. Please drop this patch for=
 4.19.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Sasha Le=
vin <sashal@kernel.org>
Sent: Friday, April 26, 2019 9:40 PM
To: linux-kernel@vger.kernel.org; stable@vger.kernel.org
Cc: Deucher, Alexander; Sasha Levin; amd-gfx@lists.freedesktop.org; dri-dev=
el@lists.freedesktop.org
Subject: [PATCH AUTOSEL 4.19 29/53] drm/amdkfd: Add picasso pci id

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit e7ad88553aa1d48e950ca9a4934d246c1bee4be4 ]

Picasso is a new raven variant.

Reviewed-by: Kent Russell <kent.russell@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_device.c
index 5aba50f63ac6..06d19bb89cfc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -275,6 +275,7 @@ static const struct kfd_deviceid supported_devices[] =
=3D {
         { 0x9876, &carrizo_device_info },       /* Carrizo */
         { 0x9877, &carrizo_device_info },       /* Carrizo */
         { 0x15DD, &raven_device_info },         /* Raven */
+       { 0x15D8, &raven_device_info },         /* Raven */
 #endif
         { 0x67A0, &hawaii_device_info },        /* Hawaii */
         { 0x67A1, &hawaii_device_info },        /* Hawaii */
--
2.19.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18098B1A85760FCFFFDD3C37F73F0BN6PR12MB1809namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
NACK.&nbsp; 4.19 did not contain support for picasso. Please drop this patc=
h for 4.19.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Sasha Levin &lt;sashal@kernel=
.org&gt;<br>
<b>Sent:</b> Friday, April 26, 2019 9:40 PM<br>
<b>To:</b> linux-kernel@vger.kernel.org; stable@vger.kernel.org<br>
<b>Cc:</b> Deucher, Alexander; Sasha Levin; amd-gfx@lists.freedesktop.org; =
dri-devel@lists.freedesktop.org<br>
<b>Subject:</b> [PATCH AUTOSEL 4.19 29/53] drm/amdkfd: Add picasso pci id</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Alex Deucher &lt;alexander.deucher@amd.com&g=
t;<br>
<br>
[ Upstream commit e7ad88553aa1d48e950ca9a4934d246c1bee4be4 ]<br>
<br>
Picasso is a new raven variant.<br>
<br>
Reviewed-by: Kent Russell &lt;kent.russell@amd.com&gt;<br>
Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
Signed-off-by: Sasha Levin &lt;sashal@kernel.org&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_device.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_device.c<br>
index 5aba50f63ac6..06d19bb89cfc 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
@@ -275,6 &#43;275,7 @@ static const struct kfd_deviceid supported_devices[=
] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x9876, &amp;carrizo_dev=
ice_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Carrizo */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x9877, &amp;carrizo_dev=
ice_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Carrizo */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x15DD, &amp;raven_devic=
e_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Raven */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x15D8, &amp;raven_device_info =
},&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Raven */<br>
&nbsp;#endif<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x67A0, &amp;hawaii_devi=
ce_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Hawaii */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 0x67A1, &amp;hawaii_devi=
ce_info },&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Hawaii */<br>
-- <br>
2.19.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18098B1A85760FCFFFDD3C37F73F0BN6PR12MB1809namp_--

--===============0145598172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0145598172==--
