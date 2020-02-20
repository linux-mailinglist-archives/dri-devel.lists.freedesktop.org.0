Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F4F167BD4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82EA6F427;
	Fri, 21 Feb 2020 11:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2536E900
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 19:03:18 +0000 (UTC)
Received: from [100.112.2.30] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.us-east-1.aws.symcld.net id 2E/B5-38805-EE7DE4E5;
 Thu, 20 Feb 2020 19:03:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VTe0xTZxTv13v7AFpzKSDfmJCtspdbC8WJdwy
 mk7Bcs0lG9oQ5xmVUWgOF9RYt29SqLHF0Gy8npYgtL+l4DIfZ0IogRToL6HhViIMsTh6Cjpqg
 mAKytdzKtn++/H7nd87vnJOcj4sIqjlBXKlaJVUqyAwh2xuV3b7pI5obiU8OHygIwWcKuwBer
 PsbwTtGIN53d5yDDz9wsPH8ynD8aHUzGy/visZPTjUBvG6oGeCm+2UcfMh8ko1f0S+i+GzXKB
 tvaLuN4KZ6HdiOEef14xzC2JJDLF0CxFnTJmLsehubOGVLIDoqGjnEH9pfmcQF4zyTcLTb2cR
 8S8jbPkksuSI1S53Cki1cKUazDwerq2yxGtC/IR94cwWYhgk7Tv+M0GQWwNryTs6acrbmO5Qm
 SwC2FlhXFYDVInB4tJ2VD7xcxIrCSa1HOAOgdnEeuAmKXUCgyen01Jcw4cjYBJMmfwJYbL0O3
 PVs7HloKC9D3dgf2whtA92IGyOYlQV/0u92Yz8sEXbqxph0ThI8VXrLkx8B+x7Wu3pzXe2egU
 7Lq+4wH0uB1dZFz0o6JnTcM656emEJcLh3CaXnXg8f9jQy6V6B8MaEYRVDDIM1bb8hNA6AM7d
 WPHu+B29c/IZFx5+C5oLznvxgOGjQAhrvgnPXSj21L8Ef7xR7cDTsnjai7jkhFgpXLLl0OAs2
 6L4HhWCz/j9T6F1ZCPYCbDaH0eGn4XHtTY5+dTNfaCubQI0ArQeRqUp5ukyVScozRJLwcJFEE
 iEKF0VIIsXk56JUcQ4lkpKUSiQRk/spMZWb+WlGmlghVbUA142mZTNGz4HKJofYAp7gMoUB/D
 2m+GTButSstFwZSck+UeZkSCkL2MDlCiFfaHdpvkppulS9R57huvTHMuTyhP78I1ddMp/KJjM
 peTot9YBXuIUzFVUId85Z7XovV9RWIQJUkaWQBgXyNW4/zF0gy1Gs2T3+O4MgOMiPDxgMhoCX
 LVVmylX/12dBIBcI/fjjbheeXKFa6+q6Xtcu/nyH31vugVTkv1KQhpl30BBc9kHcobaO/vYPh
 S3H46b7l+OnamOO7Fsu+WHzlhmWfYEZJzgWGDkJqvYWvZx/kUo05+mOtdsnG3Zu/X3f+8vqwV
 iE0aBeqHkn8t3PJg1tW4070sYrh/Z/+fXAcwcMvrzd3vdKbdK/4pL7oqa2nbjTrBlJPLDjlyQ
 yIQE8qbtsSjt68NhXJSEBjKKrXzzK294b8+xUMhFWEaXY+EYpbk1aWXdu57e77sbHak/UTY0Q
 ir1Dy53Xoqx19mleQaTDEdt6uPFMd0xKaPSk/MHpbY+kb4a+1tNb9JGt4z4ZtsWw4vzYYn7Ri
 3cooX+6lWN22i/1rUQk+TDim2rX91dVvm7RlApRSkZKNiFKivwHGfko2bYEAAA=
X-Env-Sender: mpearson@lenovo.com
X-Msg-Ref: server-23.tower-395.messagelabs.com!1582225390!2552236!1
X-Originating-IP: [104.232.225.11]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24718 invoked from network); 20 Feb 2020 19:03:10 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.11)
 by server-23.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Feb 2020 19:03:10 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 153958657650C5ABA2B7;
 Thu, 20 Feb 2020 14:03:06 -0500 (EST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Fri, 21 Feb 2020 03:03:12 +0800
Received: from HKEXEDGE02.lenovo.com (10.128.62.72) by HKGWPEMAIL04.lenovo.com
 (10.128.3.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1779.2 via Frontend
 Transport; Fri, 21 Feb 2020 03:03:12 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.52)
 by mail.lenovo.com (10.128.62.72) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1779.2; Fri, 21 Feb
 2020 03:03:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUIOr0lQMRbalXvgPU1a+U8PRSBOTJi2PBXr1rEHfOSqk3UQv4xEERrHQGniVrvHC96V973c5qDpkf3680/lCqFvYL1mc/SdLmSn5SdfKiNo3+nZ5nK3XktudtyGVX3c32Eyz8OFT6KAO5VuZDNo8fDnmuF8r1XkBAy1cKYN1C3doPvF3Gn4NH57xFgYCYf9T45bA1b7BK+ioe6MGt5APBu0ij+X5wb1xMw7N6FxwOkDb70ltdpv2wq7t43hK4tCyVVWobp8Hw1TAGEyCWtn8o53o9YSMoJoPIK42OwoGCs5CZtbnOYSZdiHexIOU2NVjghTy/KuHN82OQ817gi/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxW/XJpXtjFvOrAy1Q2dLR6xDZFJP8iWKzdakHj5oMg=;
 b=N4ymj/syq8LB3joa3S9ShClb91S03dqIPkcW7mWyzhbDdsCxF3fDSVxjsQx1gxZJR9x110nyHynhxZThiAX1kiLJpsi5Pkj2rmMIujGMt9mdzcvp6IpskhrrI6O5f8SX4bkdiRah/fbqjBBJdfOs2xY1VVg7ljKnaGPy/pF1EWn4skayZ/G5Mo58vVIVtv9W8vTsMgq88E+mWXemr4wX05py2gY/sJEVnV3b8wkmVbQi/Ipc+OWIWkSPFeCJEOwNFQGsGW3S/ZVUgwOhqxDbcEVjXZ8fO/InjICj6wJJ5rAtGlTk94NiUL8bzejp4+bT6mByK1KiOd0FzLe9IFgRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxW/XJpXtjFvOrAy1Q2dLR6xDZFJP8iWKzdakHj5oMg=;
 b=B2xgpLxNJlTxrk5jCAzGWGWgVRvlav0Jk20z7OhHllNaFuytxyMW/AFKKeQcTl4q+JNyQ5YLV1SezJ4wUHAXneEP0OjeBNVjmuOVEnsrfnrmfWDzTKVurRqaewfZ87AZM5zgJqZSCDMDc15JASiMFvgYnhr7oWLwRdXQfETE+Vg=
Received: from PS1PR0302MB2604.apcprd03.prod.outlook.com (10.170.180.15) by
 PS1PR0302MB2571.apcprd03.prod.outlook.com (10.170.183.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.8; Thu, 20 Feb 2020 19:03:00 +0000
Received: from PS1PR0302MB2604.apcprd03.prod.outlook.com
 ([fe80::f195:23a8:c12b:5be]) by PS1PR0302MB2604.apcprd03.prod.outlook.com
 ([fe80::f195:23a8:c12b:5be%12]) with mapi id 15.20.2750.016; Thu, 20 Feb 2020
 19:03:00 +0000
From: Mark Pearson <mpearson@lenovo.com>
To: Rajat Jain <rajatja@google.com>
Subject: RE: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
Thread-Topic: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
Thread-Index: AQHV6B0j3nBIaF9kb0aMAt2+jGCbwKgkbFcA
Date: Thu, 20 Feb 2020 19:03:00 +0000
Message-ID: <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
References: <20200220074637.7578-1-njoshi1@lenovo.com>
 <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
 <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
 <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
In-Reply-To: <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.48.229.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8a379d1-32f0-47dd-6ad3-08d7b6378137
x-ms-traffictypediagnostic: PS1PR0302MB2571:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PS1PR0302MB25715E384BAECBFE19D96225BD130@PS1PR0302MB2571.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(396003)(346002)(39860400002)(136003)(199004)(189003)(71200400001)(54906003)(52536014)(5660300002)(55016002)(33656002)(316002)(478600001)(7416002)(66946007)(66476007)(9686003)(4326008)(2906002)(86362001)(6916009)(7696005)(966005)(81166006)(8936002)(81156014)(8676002)(76116006)(6506007)(26005)(66556008)(66446008)(186003)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PS1PR0302MB2571;
 H:PS1PR0302MB2604.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: lenovo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1e2oNBN73FsA97Faw1fyJFWVkZlTCsGWnca8Q6zltQhbzdhRacHz47jR6v0/pplmkGyo9iUJIMN3T6vRTnDBdjkhFFezvImtFgr4b7EBdLbQnsSv9LtsIesIBo86zx+Uj6lqk/+obEwUYTTYuQ05WYlbNQocZSk4XlVXlaUEYzi6G1Ro11VfHZk1SQ+pXmkFxR7AM0EWLzBSbNMnq+L/H0t5q2ewHJaxDAcGdRlSVfixPYAjotaAicJsww6ome+Q2vhlSSxKjxOF2CqJ4DqWL92gZj0BZGyEN8NEzVjh/SFEGTjwSFq69P8ZJ5ny71Tog/z/duPpNY4Nmbr+g60esiZRJU70cCafp7+fBVWfTpWMXUHti8bWsNCZDM9YJ4/dNujV2nixMTf5xlHp/Munc3tZi2L1s6v1Kf08iOc+Og+Q3gGDnad9uFFwYP8j0tHxfxXApRHYBSP8zp4enY0MXki+x5+j5/aOGUOxjkH0vyBT32ee1w9lencKw21Rodvp+XZvefOL3yegPlDsl86jLA==
x-ms-exchange-antispam-messagedata: lIu4BOuhcB9MvSKTOfStLmoZbsgr+XzZqHQW0daUfR4kaHYztIDfNJmF/xJDJkFF4zpSLnrVcY27tTfTDiKDH2EdFKVAk5wMltJvA0l1NoFPV++todnxOH34PzCCyu84GEhoxO21gM4rSnKINVCYtQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a379d1-32f0-47dd-6ad3-08d7b6378137
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 19:03:00.0934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygTGUFPqpwF2EgoMAZXebUOIK1sdk8CmUJ7qTYcYIpxk/g29azrOEM/+8X0aRQfgpzlZkjkL41sLMDLUKUGBnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0302MB2571
X-OriginatorOrg: lenovo.com
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Benjamin Berg <bberg@redhat.com>,
 Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Mat King <mathewk@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Nitin Joshi1 <njoshi1@lenovo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Darren Hart <dvhart@infradead.org>, Nitin Joshi <nitjoshi@gmail.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rajat,

> -----Original Message-----
> From: Rajat Jain <rajatja@google.com>
> Sent: Thursday, February 20, 2020 1:39 PM
> >
> > For this particular issue what is the best way to contribute and get
> > involved? We'd like to make it so ePrivacy can be used more easily from
> > Linux. I agree a more generic way of controlling it would be good.
> > I looked at the proposed patch from Rajat
> > (https://lkml.org/lkml/2019/10/22/967) - it seems like a good solution to me.
> > We can help with testing that on our platforms if that would be useful.
> 
> Thanks you, just so that you know, the latest patchset is at:
> https://lkml.org/lkml/2019/12/20/794
> 
> It would be great to get some additional testing if possible. I can
> send a sample ACPI (for our platform) in case it helps.
> 
Sounds good - we'll definitely try this out and see how it goes. I suspect we'll have some questions once we try it out and get more familiar.

> >
> > I need to understand how we connect that implementation with the ACPI
> > controls we have (as I believe what we have are thinkpad specific and not to
> > a drm spec; we need to confirm that). We also have the ACPI events that
> > notify if ePrivacy was changed by the hotkeys and that seems like something
> > that should be done in thinkpad_acpi.c and not the drm code.
> > 
> > Not sure if the two need to be connected somehow (or if handling the
> > event is actually not important and polling is acceptable)?
> 
> So there was some brief discussion about this on my patches - but
> atleast on  the platforms I have seen, there was no way to change the
> privacy screen out of software / kernel control. Essentially, if there
> are hotkeys, they would send an input event to the kernel, who'd send
> them to userspace, who'd use the DRM method to toggle the privacy
> screen. Thus the current version of the patch only supports
> controlling the privacy screen via set() method. The get() method just
> returns the cached value.I hope that works for you.
> 
OK - on the thinkpads we have function+D as a 'hotkey' to control the feature...and my understanding is that bypasses everything and goes straight to the firmware.

The changes Nitin had been working on in thinkpad_acpi.c was to make this more Linux and friendly - provide a sysfs hook for user space to connect to with the aim of allowing it to be configured from user space and have on screen display when it was triggered etc.

I'm personally not sure yet how this ties up with the DRM method - more digging required. I'm intrigued to see if it works on our systems (sadly I don't have anything with that feature available on my desk right now...I need to get my hands on one)

Thanks
Mark
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
